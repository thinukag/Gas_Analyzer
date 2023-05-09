import 'package:flutter/material.dart';



class MonthlyUsage extends StatefulWidget {
  @override
  _MonthlyUsageState createState() => _MonthlyUsageState();
}

class _MonthlyUsageState extends State<MonthlyUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Usage'),
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