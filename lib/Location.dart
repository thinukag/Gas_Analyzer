import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'package:gasit/models/state.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CustomerLocation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomerLocationState();
}

class _CustomerLocationState extends State<CustomerLocation> {
//  StateModel appState;
  StreamSubscription _locationSubscription;
  Location _locationTracker = new Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  Firestore firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(6.9271, 79.8612),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData bytedata =
        await DefaultAssetBundle.of(context).load("assets/images/dot.png");
    return bytedata.buffer.asUint8List();
  }

  void updateMakerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);

    this.setState(() {
      marker = Marker(
          markerId: MarkerId("Home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));

      circle = Circle(
          circleId: CircleId("Bus"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.orange,
          center: latlng,
          fillColor: Colors.orange.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMakerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 15.00)));
          updateMakerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // final email = appState?.firebaseUserAuth?.email ?? '';
   // final firstName = appState?.user?.firstName ?? '';
    return new Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] : []),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          getCurrentLocation();
          //sec5Timer();
          _addGeoPoint();
        },
      ),

      // floatingActionButton: SpeedDial(
      //   animatedIcon: AnimatedIcons.close_menu,
      //   curve: Curves.bounceInOut,
      //   overlayColor: Colors.black54,
      //   backgroundColor: Colors.redAccent,
      //   foregroundColor: Colors.white,
      //   animatedIconTheme: IconThemeData.fallback(),
      //   shape: CircleBorder(),
      //   children: [
      //     SpeedDialChild(
      //       child: Icon(Icons.add_location),
      //       backgroundColor: Colors.green,
      //       label: 'Current Location',
      //       onTap: () {
      //         getCurrentLocation();
      //       },
      //     ),
      //     SpeedDialChild(
      //       child: Icon(Icons.location_searching),
      //       backgroundColor: Colors.deepOrange,
      //       label: "Send Location",
      //       onTap: () {
      //         _addGeoPoint();
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  //Add Geo Point
  Future<DocumentReference> _addGeoPoint() async {
    var pos = await _locationTracker.getLocation();
    GeoFirePoint point =
        geo.point(latitude: pos.latitude, longitude: pos.longitude);
    return firestore
        .collection('Dealerlocation')
        .add({'position': point.data, 'User name': 'Dealer'});
  }

  // Timer
  // bool isStopped = false; //global

  // sec5Timer() {
  //   Timer.periodic(Duration(seconds: 10), (timer) {
  //    // if (isStopped) {
  //       timer.cancel();
  //     }
  //     //_addGeoPoint();
  //   //});
  //}
}
