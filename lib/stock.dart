import 'package:flutter/material.dart';



class StockUsage extends StatefulWidget {
  @override
  _StockUsageState createState() => _StockUsageState();
}

class _StockUsageState extends State<StockUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock'),
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