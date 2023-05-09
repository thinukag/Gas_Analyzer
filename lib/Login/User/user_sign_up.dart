import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/parentuser.dart';
import 'package:flutter_application_1/util/auth.dart';
import 'package:flutter_application_1/util/validator.dart';
import 'package:flutter_application_1/widgets/loading.dart';

class ParentSignUpScreen extends StatefulWidget {
  _ParentSignUpScreenState createState() => _ParentSignUpScreenState();
}

class _ParentSignUpScreenState extends State<ParentSignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _parentName = new TextEditingController();
  final TextEditingController _childName = new TextEditingController();
  final TextEditingController _parentemail = new TextEditingController();
  final TextEditingController _parentphoneNumber = new TextEditingController();
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
      child:  Align(
        alignment: Alignment.center,
        child: Image.asset("assets/Logo.png", height: 150, width: 150),
      ),
    );

    final parentName = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _parentName,
      validator: Validator.validateName,
      decoration: InputDecoration(
        fillColor: Colors.white, filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.person,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final childName = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _childName,
      validator: Validator.validateName,
      decoration: InputDecoration(
        fillColor: Colors.white, filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.person,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
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

        final parentphoneNumber = TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      controller: _parentphoneNumber,
      validator: Validator.validatePhoneNumber,
      decoration: InputDecoration(
        fillColor: Colors.white, filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.call,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Mobile Number',
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

    final signUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          _emailSignUp(
              parentName: _parentName.text,
              childName: _childName.text,
              parentemail: _parentemail.text,
              parentphoneNumber: _parentphoneNumber.text,
              parentpassword: _parentpassword.text,
              context: context);
        },
        padding: EdgeInsets.all(12),
        color: Colors.orange,
        child: Text('SIGN UP', style: TextStyle(color: Colors.white)),
      ),
    );

    final signInLabel = FlatButton(
      child: Text(
        'Have an Account? Sign In.',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/signin');
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
                      SizedBox(height: 20.0),
                      parentName,
                      SizedBox(height: 1.0),
                      childName,
                      SizedBox(height: 1.0),
                      parentemail,
                      SizedBox(height: 1.0),
                      parentphoneNumber,
                      SizedBox(height: 1.0),
                      parentpassword,
                      SizedBox(height: 12.0),
                      signUpButton,
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

  void _emailSignUp(
      {String parentName,
      String childName,
      String parentemail,
      String parentphoneNumber,
      String parentpassword,
      BuildContext context}) async {
    if (_formKey.currentState.validate()) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        await _changeLoadingVisible();
        //need await so it has chance to go through error if found.
        await Auth.parentsignUp(parentemail, parentpassword).then((uID) {
          Auth.addParentUserSettingsDB(new ParentUser(
            parentId: uID,
            parentemail: parentemail,
            parentphoneNumber: parentphoneNumber,
            parentName: parentName,
            childName: childName,
          ));
        });
        //now automatically login user too
        //await StateWidget.of(context).logInUser(email, password);
        await Navigator.pushNamed(context, '/parentsignin');
      } catch (e) {
        _changeLoadingVisible();
        print("Sign Up Error: $e");
        String exception = Auth.getExceptionText(e);
        Flushbar(
          title: "Sign Up Error",
          message: exception,
          duration: Duration(seconds: 5),
        )..show(context);
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }
}
