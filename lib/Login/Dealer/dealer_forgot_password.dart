import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/util/auth.dart';
import 'package:flutter_application_1/util/validator.dart';
import 'package:flutter_application_1/widgets/loading.dart';

class ParentForgotPasswordScreen extends StatefulWidget {
  _ParentForgotPasswordScreenState createState() =>
      _ParentForgotPasswordScreenState();
}

class _ParentForgotPasswordScreenState
    extends State<ParentForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _parentemail = new TextEditingController();

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

    final forgotPasswordButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          _forgotPassword(parentemail: _parentemail.text, context: context);
        },
        padding: EdgeInsets.all(12),
        color: Colors.orange,
        child: Text('FORGOT PASSWORD', style: TextStyle(color: Colors.white)),
      ),
    );

    final signInLabel = FlatButton(
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/parentsignin');
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
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      logo,
                      SizedBox(height: 68.0),
                      parentemail,
                      SizedBox(height: 0.0),
                      forgotPasswordButton,
                      signInLabel
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

  void _forgotPassword({String parentemail, BuildContext context}) async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (_formKey.currentState.validate()) {
      try {
        await _changeLoadingVisible();
        await Auth.forgotParentPasswordEmail(parentemail);
        await _changeLoadingVisible();
        Flushbar(
          title: "Password Reset Email Sent",
          message:
              'Check your email and follow the instructions to reset your password.',
          duration: Duration(seconds: 20),
        )..show(context);
      } catch (e) {
        _changeLoadingVisible();
        print("Forgot Password Error: $e");
        String exception = Auth.getExceptionText(e);
        Flushbar(
          title: "Forgot Password Error",
          message: exception,
          duration: Duration(seconds: 10),
        )..show(context);
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }
}
