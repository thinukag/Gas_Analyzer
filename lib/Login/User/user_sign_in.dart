import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/util/auth.dart';
import 'package:flutter_application_1/util/state_widget.dart';
import 'package:flutter_application_1/util/validator.dart';
import 'package:flutter_application_1/widgets/loading.dart';

class ParentSignInScreen extends StatefulWidget {
  _ParentSignInScreenState createState() => _ParentSignInScreenState();
}

class _ParentSignInScreenState extends State<ParentSignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _parentemail = new TextEditingController();
  final TextEditingController _parentpassword = new TextEditingController();

  bool _autoValidate = false;
  bool _loadingVisible = false;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Align(
        alignment: Alignment.center,
        child: Image.asset("assets/Logo.png", height: 200, width: 200),
      ),
    );

    final parentemail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _parentemail,
      validator: Validator.validateEmail,
      decoration: InputDecoration(
        fillColor: Colors.white, filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.email,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final parentpassword = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _parentpassword,
      validator: Validator.validatePassword,
      decoration: InputDecoration(
        fillColor: Colors.white, filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.lock,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(54),
        ),
        onPressed: () {
          _parentemailLogin(
              parentemail: _parentemail.text,
              parentpassword: _parentpassword.text,
              context: context);
        },
        padding: EdgeInsets.all(12),
        color: Colors.orange,
        child: Text('SIGN IN', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/parent-forgot-password');
      },
    );

    final signUpLabel = FlatButton(
      child: Text(
        'Create an Account',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/parentsignup');
      },
    );

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: LoadingScreen(
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 68.0),
                      logo,
                      SizedBox(height: 48.0),
                      parentemail,
                      SizedBox(height: 4.0),
                      parentpassword,
                      SizedBox(height: 12.0),
                      loginButton,
                      forgotLabel,
                      signUpLabel
                    ],
                  ),
                ),
              ),
            ),
          ),
          inAsyncCall: _loadingVisible),
    ));
  }

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  void _parentemailLogin(
      {String parentemail, String parentpassword, BuildContext context}) async {
    if (_formKey.currentState.validate()) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        await _changeLoadingVisible();
        //need await so it has chance to go through error if found.
        await StateWidget.of(context)
            .logInParentUser(parentemail, parentpassword);
        await Navigator.pushNamed(context, '/usermenu');
      } catch (e) {
        _changeLoadingVisible();
        print("Sign In Error: $e");
        String exception = Auth.getExceptionText(e);
        Flushbar(
          title: "Sign In Error",
          message: exception,
          duration: Duration(seconds: 5),
        )..show(context);
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }
}
