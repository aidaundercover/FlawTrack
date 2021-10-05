import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';

class MapsOfProblems extends StatefulWidget {
  const MapsOfProblems({Key? key}) : super(key: key);

  @override
  _MapsOfProblemsState createState() => _MapsOfProblemsState();
}

class _MapsOfProblemsState extends State<MapsOfProblems> {
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;
  bool popped = true;
  

  @override
  void initState() {
    super.initState();
    setCustomMaker();
  }

  void setCustomMaker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/pins/trashcan.png');
  }

  void _showcontent() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Выберет город'),
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
            )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

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
          onMapCreated: _onMapCreated,
          initialCameraPosition:
              CameraPosition(target: LatLng(52.2999988, 76.9499962)),
          zoomControlsEnabled: true,
          minMaxZoomPreference: MinMaxZoomPreference(15, 22),
        ),
        bottomNavigationBar: popped
            ? Container(
                width: _width,
                height: 410,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: white,
                ),
                child: Container(
                  width: _width * 0.898,
                  child: Center(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Нур-Султан',
                                style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.underline),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _showcontent();
                                  },
                                  icon: Icon(
                                    Icons.edit_location_alt,
                                    size: 25,
                                  ))
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 35,
                                color: grey,
                              ))
                        ],
                      ),
                      Container(
                        height: 173,
                        child: Row(
                          children: [
                            Container(
                              width: _width * 0.572,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {}, 
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: grey.withOpacity(0.9)),
                                            borderRadius: BorderRadius.circular(10),
                                            color: white
                                          ),
                                          alignment: Alignment.center,
                                          child: Image.asset('assets/pins/trashcan.png', width: 20,),
                                        )),
                                        ElevatedButton(
                                        onPressed: () {}, 
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: grey.withOpacity(0.9)),
                                            borderRadius: BorderRadius.circular(10),
                                            color: white
                                          ),
                                          alignment: Alignment.center,
                                          child: Image.asset('assets/pins/drown.png', width: 20,),
                                        ))
                                    ]
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text('Координаты', style: TextStyle(fontSize:15),),
                                Table(children: [
                                    TableRow( children: [  
                                      Column(children:[Text('x', style: TextStyle(fontSize: 15, color: black.withOpacity(0.8)),)]),  
                                      Column(children:[Text('$htmlEscape', style: TextStyle(fontSize: 15.0, color: grey))]),  
                                    ]),  
                                    TableRow( children: [  
                                      Column(children:[Text('y', style: TextStyle(fontSize: 15, color: black.withOpacity(0.8)),)]),  
                                      Column(children:[Text('$htmlEscape', style: TextStyle(fontSize: 15.0, color: grey))]),  
                                    ]),
                                ],),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Container(
                                  width: _width*0.263,
                                  height: 78,
                                  decoration:  BoxDecoration(
                                    color: yellow,
                                    boxShadow: [BoxShadow(
                                      
                                    )]
                                  )
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
                ),
              )
            : Container(
                width: _width,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: white,
                ),
                child: Container(
                  width: _width * 0.898,
                  child: Row(
                    children: [
                      Text(
                        'Нур-Султан',
                        style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                                size: 35,
                                color: grey,
                        ))
                    ],
                  ),
                ),
              ));
  }
}
