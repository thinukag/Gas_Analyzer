import 'package:flutter/material.dart';
import 'package:flutter_application_1/stock.dart';
import 'package:flutter_application_1/orders.dart';
import 'package:flutter_application_1/location_d.dart';
import 'package:flutter_application_1/notification_d.dart';

class DashScreen2 extends StatefulWidget {
  @override
  _DashScreen2State createState() => _DashScreen2State();
}

class _DashScreen2State extends State<DashScreen2> {
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
                        builder: (context) => Orders(),), );
                  },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Gas.png',),height: 120,),
                    Text('Orders'),
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
                        builder: (context) => StockUsage(),), );
                  },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Stock.png',),height: 120,),
                Text('Stock')
                
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
                        builder: (context) => Locationd(),), );
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
                        builder: (context) => NoteUsage(),), );
                  },
                  child: Column(children: [
                    Image(image: AssetImage('assets/images/Notification.png',),height: 120,),
                Text('Notification')
                
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