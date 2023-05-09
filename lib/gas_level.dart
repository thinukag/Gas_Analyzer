import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'models/module.dart';


class GasPercentage extends StatefulWidget {
  @override
  _GasPercentageState createState() => _GasPercentageState();
}

class _GasPercentageState extends State<GasPercentage> {
  List<myData> allData = [];

   @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Weight').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        myData d = new myData(
          data[key]['Weight'],
          //data[key]['message'],
        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          child: allData.length == 0
              ? new Text('')
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      allData[index].name,
                      //allData[index].message,
                    );
                  },
                )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UI(double name) {
    return new Card(
      elevation: 0.0,
      child: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Gaslevel.png"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        //child: Text("YOUR TEXT"),
        padding: new EdgeInsets.fromLTRB(110, 330, 10, 410),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('$name',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent, fontSize: 35),),
            //new Text('Message : $message'),
          ],
        ),
      ),
    );
  }
}