import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsOfProblems extends StatefulWidget {
  const MapsOfProblems({Key? key}) : super(key: key);

  @override
  _MapsOfProblemsState createState() => _MapsOfProblemsState();
}

class _MapsOfProblemsState extends State<MapsOfProblems> {
  Set<Marker> _markers = {};

  static addProblem(
      {required String lat,
      required double lang,
      required double type,
      Map? details}) {
    Map markerData = {
      "lat": lat,
      "lang": lang,
      "type": "$type",
      "details": details
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('problems');
    collectionReference.add(markerData);
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
              title: 'something',
              snippet: 'very very bad(in Indian accent)',
              
            )
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: primaryColor,
        title: Text(
          "Карта проблем",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.chevron_left_outlined, size: 35, color: black),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(52.2999988, 76.9499962)),
        zoomControlsEnabled: true,
        minMaxZoomPreference: MinMaxZoomPreference(15, 22),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: white,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
