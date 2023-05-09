import 'package:flutter/material.dart';
import 'package:flutter_application_1/dash_screen.dart';
import 'package:flutter_application_1/splashscreen.dart';
import 'package:flutter_application_1/util/state_widget.dart';

import 'Login/Dealer/dealer_forgot_password.dart';
import 'Login/Dealer/dealer_sign_in.dart';
import 'Login/Dealer/dealer_sign_up.dart';
import 'Login/User/user_forgot_password.dart';
import 'Login/User/user_sign_in.dart';
import 'Login/User/user_sign_up.dart';
import 'dash_suplier.dart';
//import 'dash_screen.dart';

class MyApp extends StatelessWidget {
  MyApp() {
    //Navigation.initPaths();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp Title',
      //theme: buildTheme(),
      //onGenerateRoute: Navigation.router.generator,
      debugShowCheckedModeBanner: false,
      routes: {
        '/signin': (context) => SignInScreen(),
        '/parentsignin': (context) => ParentSignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/parentsignup': (context) => ParentSignUpScreen(),
        '/': (context) => SplashScreen(),
        '/dealermenu': (context) => DashScreen2(),
        '/usermenu': (context) =>  DashScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/parent-forgot-password': (context) => ParentForgotPasswordScreen(),
      },
    );
  }
} 

void main() {
  StateWidget stateWidget = new StateWidget(
    child: new MyApp(),
  );
  runApp(stateWidget);
}




// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/splashscreen.dart';
// import 'package:flutter_application_1/util/state_widget.dart';
// import 'package:flutter_application_1/util/state_widget.dart';
// import 'package:flutter_application_1/util/state_widget.dart';
// import 'package:flutter_application_1/util/state_widget.dart';
// import 'package:provider/provider.dart';

// import 'Login/Dealer/dealer_forgot_password.dart';
// import 'Login/Dealer/dealer_sign_in.dart';
// import 'Login/Dealer/dealer_sign_up.dart';
// import 'Login/User/user_forgot_password.dart';
// import 'Login/User/user_sign_in.dart';
// import 'Login/User/user_sign_up.dart';

// void main() {
//   StateWidget stateWidget = new StateWidget(
//     child: new MyApp(),
//   );
//   runApp(stateWidget);
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       child: MaterialApp(
//         title: 'MyApp Title',
//         //theme: buildTheme(),
//         //onGenerateRoute: Navigation.router.generator,
//         debugShowCheckedModeBanner: false,
//         routes: {
//           '/signin': (context) => SignInScreen(),
//           '/parentsignin': (context) => ParentSignInScreen(),
//           '/signup': (context) => SignUpScreen(),
//           '/parentsignup': (context) => ParentSignUpScreen(),
//           '/': (context) => SplashScreen(),
//           //'/map': (context) => DriverGoogleMapPage(),
//           //'/usermenu': (context) => UserMenu(),
//           '/forgot-password': (context) => ForgotPasswordScreen(),
//           '/parent-forgot-password': (context) => ParentForgotPasswordScreen(),
//           //'/dealermenu': (context) => DealerMenu(),
//           //DetailPage.routeName: (ctx) => DetailPage(),
//           //CartScreen.routeName: (ctx) => CartScreen(),
//         },
//       ),
//     );
//   }
// }
