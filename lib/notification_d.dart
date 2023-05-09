import 'package:flutter/material.dart';



class NoteUsage extends StatefulWidget {
  @override
  _NoteUsageState createState() => _NoteUsageState();
}

class _NoteUsageState extends State<NoteUsage> {
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