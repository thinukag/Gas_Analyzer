import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/parentuser.dart';
import 'package:flutter_application_1/models/settings.dart';
import 'package:flutter_application_1/models/user.dart';

class StateModel {
  bool isLoading;
  FirebaseUser firebaseUserAuth;
  User user;
  ParentUser parentUser;
  Settings settings;

  StateModel({
    this.isLoading = false,
    this.firebaseUserAuth,
    this.user,
    this.parentUser,
    this.settings,
  });
}
