import 'package:flutter/material.dart';

import 'Login/Dealer/dealer_sign_in.dart';
import 'Login/User/user_sign_in.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

bool _loadingVisible = false;

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Align(
        alignment: Alignment.center,
        child: Image.asset("assets/Logo.png", height: 200, width: 200),
      ),
    );
    final userButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ParentSignInScreen()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.orange,
        child: Text('LPG User', style: TextStyle(color: Colors.white)),
      ),
    );
    final dealerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.orange,
        child:
            Text('LPG Service Provider', style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            //background image
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/Background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 74.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 108.0),
                      logo,
                      SizedBox(height: 98.0),
                      userButton,
                      dealerButton,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        // inAsyncCall: _loadingVisible
      ),
      // body: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/Background.png"),
      //       fit: BoxFit.cover,
      //       )
      //   ),

      //   padding: EdgeInsets.fromLTRB(110, 120, 100, 70),

      // child: GridView.count(
      //   crossAxisCount: 1,
      //   children: <Widget>[

      //     Card(
      //       color: Colors.orangeAccent,
      //       margin: EdgeInsets.all(8.0),
      //       child: InkWell(
      //         onTap: (){
      //            Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ParentSignInScreen()),
      //   );
      //         },
      //         splashColor: Colors.deepOrangeAccent,
      //         child: Center(
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: <Widget>[
      //               Text("Parent", style: new TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),),
      //             ]
      //           ),
      //         ),
      //       ),
      //       ),
      //       Card(
      //       color: Colors.orangeAccent.shade400,
      //       margin: EdgeInsets.all(8.0),
      //       child: InkWell(
      //         onTap: (){
      //            Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => SignInScreen()),
      //   );
      //         },
      //         splashColor: Colors.orangeAccent,
      //         child: Center(
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: <Widget>[
      //               Text("Driver", style: new TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),),

      //             ]
      //           ),
      //         ),
      //       ),
      //       )
      //   ],
      // ),
    );
  }
}
