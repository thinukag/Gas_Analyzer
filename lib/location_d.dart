import 'package:flutter/material.dart';


class Locationd extends StatefulWidget {
  @override
  _LocationdState createState() => _LocationdState();
}

class _LocationdState extends State<Locationd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Stack(
        children: [
          Container(height: MediaQuery.of(context).size.height,
          ),
        ],

      ),
    );
  }
}