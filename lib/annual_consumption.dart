import 'package:flutter/material.dart';


class AnnualConsumption extends StatefulWidget {
  

  @override
  _AnnualConsumptionState createState() => _AnnualConsumptionState();
}

class _AnnualConsumptionState extends State<AnnualConsumption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Annual Consumption'),
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