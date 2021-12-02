import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';

class MapsOfCorrections extends StatefulWidget {
  const MapsOfCorrections({Key? key}) : super(key: key);

  @override
  _MapsOfCorrectionsState createState() => _MapsOfCorrectionsState();
}

class _MapsOfCorrectionsState extends State<MapsOfCorrections> {
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;
  bool _toggled = false;

  @override
  void initState() {
    super.initState();
    dropDown();
  
  }

  void setCustomMaker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/pins/fixed.png');
  }

  void _showcontent() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Выберете город'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                ListTile(
                  title: Text('Аксу'),
                ),
                ListTile(
                  title: Text('Алматы'),
                ),
                ListTile(
                  title: Text('Петропавлск'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('problems');

    setState(() {
      for (int i = 0; i <= collectionReference.id.length; i++) {
        _markers.add(Marker(
            markerId: MarkerId(collectionReference.id),
            position: LatLng(52.2999988, 76.9499962),
            infoWindow: InfoWindow(
              title: '',
              snippet: 'very very bad(in Indian accent)',
            )));
      }
    });
  }

  void dropDown() {
    setState(() {
      _toggled = !_toggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Stack(
      children: [ 
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: primaryColor,
            title: Text(
              "Карта исправлений",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: black),
            ),
            centerTitle: true,
            leading: Builder(
              builder: (context) => IconButton(
                  icon: Icon(Icons.chevron_left_outlined, size: 35, color: black),
                  onPressed: () => Navigator.pop(context)),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.more_vert_outlined,
                      size: 27, color: Colors.black),
                  onPressed: () {
                    dropDown();
                  }),
            ],
          ),
          body: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(lat, long), zoom: 12, bearing: 30, tilt: 80),
              zoomControlsEnabled: true,
              minMaxZoomPreference: MinMaxZoomPreference(15, 22),
              onMapCreated: _onMapCreated,
              markers: _markers,
              myLocationButtonEnabled: true,
            ),),
        Positioned(
          top: 40,
          right: 30,
          child:_toggled ? 
          Container(
            width: 324,
            height: 400,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.25),
                  offset: Offset(0,4)
                )
              ]
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Center(child: Text('История исправлений',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                    IconButton(onPressed: () {
                        dropDown();
                    }, 
                    icon: Icon(Icons.close, size: 25, color:black))
                  ],
                ),
                Text('Сегодня', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],),
          ) : Container())
      ],
    );
  }
}
