

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/gas_level.dart';
import 'package:flutter_application_1/store.dart';
import 'package:flutter_application_1/Location.dart';
import 'package:flutter_application_1/notification.dart';
import 'package:flutter_application_1/mothly_usage.dart';
import 'package:flutter_application_1/annual_consumption.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45,
          BlendMode.darken),
          )
          ),
      child: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        primary: false,
        children: [
          
          Card(
            shadowColor: Colors.white,
            elevation: 10,
            color: Colors.cyan,            
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) ),
            margin: EdgeInsets.only(
            left: 30,
            top: 30,
            ),
            child: Column(
              
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => GasPercentage(),
        ),
        );
                  },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Gas.png',),height: 120,),
                    Text('Gas Level'),
                  ],),
                ),
              ],             
            ),
            
          ),
          Card(
            shadowColor: Colors.white,
            elevation: 10,
            color: Colors.purpleAccent,            
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) ),
            margin: EdgeInsets.only(
              right: 30,
              top: 30,
              ),
            child: Column(
              
              children: [
                 InkWell(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => Store(),
                 ),
                  );
                    },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Store.png',),height: 120,),
                    Text('Store')
                
                  ],),
                 ),
              ],
            ),
          ),
          Card(
            shadowColor: Colors.white,
            elevation: 10,
            color: Colors.tealAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10) ),
            margin: EdgeInsets.only(
              left: 30,
              top: 30,
              ),
            child: Column(
              
              children: [
                 InkWell(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => CustomerLocation(),
                 ),
                  );
                  },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Location.png',),height: 120,),
                Text('Location')
                
                  ],),
                 ),
                
              ],
            ),
          ),
          Card(
            shadowColor: Colors.white,
            elevation: 10,
            color: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10) ),
            margin: EdgeInsets.only(
              right: 30,
              top: 30,
              ),
            child: Column(
              
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => NotificationUser(),
        ),
        );
                },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Notification.png',),height: 120,),
                Text('Notification')
                
                  ],),
                 ),
              ],
            ),
          ),
          Card(
            shadowColor: Colors.white,
            elevation: 10,
            color: Colors.limeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10) ),
            margin: EdgeInsets.only(
              left: 30,
              top: 30,
              ),
            child: Column(
              
              children: [
                 InkWell(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => MonthlyUsage(),
        ),
        );
                  },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Month.png',),height: 120,),
                Text('Monthly Usage')
                
                  ],),
                 ),
              ],
            ),
          ),
          Card(
            shadowColor: Colors.white,
            elevation: 10,
            color: Colors.lightGreenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10) ),
            margin: EdgeInsets.only(
              right: 30,
              top: 30,
              ),
            child: Column(
              
              children: [
                 InkWell(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => AnnualConsumption(),
        ),
        );
                  },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Annual.png',),height: 120,),
                Text('Annual Consumption')
                
                  ],),
                 ),
              ],
            ),
          ),
        ],
        crossAxisCount: 2),
    );

  }
}