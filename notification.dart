import 'package:flutter/material.dart';


class NotificationUser extends StatefulWidget {
  

  @override
  _NotificationUserState createState() => _NotificationUserState();
}

class _NotificationUserState extends State<NotificationUser> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45,
            BlendMode.darken),
          ),
          ),
      ),
    );
  }
}