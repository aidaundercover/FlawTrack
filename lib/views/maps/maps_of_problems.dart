import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsOfProblems extends StatefulWidget {
  const MapsOfProblems({Key? key}) : super(key: key);

  @override
  _MapsOfProblemsState createState() => _MapsOfProblemsState();
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

class _MapsOfProblemsState extends State<MapsOfProblems> {
  Set<Marker> _markers = {};

  late BitmapDescriptor mapMarker1;
  late BitmapDescriptor mapMarker2;
  late BitmapDescriptor mapMarker3;
  late BitmapDescriptor mapMarker4;
  late BitmapDescriptor mapMarker5;
  late BitmapDescriptor mapMarker6;

  bool popped = true;

  String mapCity = cityGlobal.toString();
  String _mapLat = lat.toString();
  String _mapLong = long.toString();

  @override
  void initState() {
    super.initState();
    setCustomMaker();
    dropDown();
  }

  void setCustomMaker() async {
    mapMarker1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), 'assets/pins/road.png');
    mapMarker2 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), 'assets/pins/road.png');
    mapMarker3 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), 'assets/pins/drown.png');
    mapMarker4 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), 'assets/pins/dog.png');
    mapMarker5 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), 'assets/pins/trash.png');
    mapMarker6 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), 'assets/pins/cat.png');
  }

  void dropDown() {
    setState(() {
      popped = !popped;
    });
  }

  void _showcontent() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Выберете город:'),
          content: new SingleChildScrollView(
              child: ListView.builder(
                  itemCount: _cities.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return ListTile(
                      title: _cities[index]['title'],
                      onTap: () {
                        setState(() {
                          mapCity = _cities[index]['title'].toString();
                        });
                      },
                    );
                  })),
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
    setCustomMaker();
    _markers.add(
      Marker(
          icon: mapMarker1,
          markerId: MarkerId('id-1'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Мусор в неположенном месте',
            snippet: 'Пластиковые и бытовые отходы',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker2,
          markerId: MarkerId('id-2'),
          position: LatLng(52.2498763, 76.9514241),
          infoWindow: InfoWindow(
            title: 'Асфальтовая яма',
            snippet: 'тратуар сломан',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker3,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Потоп',
            snippet: 'потоп',
          )),
    );
    _markers.add(Marker(
        icon: mapMarker4,
        markerId: MarkerId('id-4'),
        position: LatLng(52.2504187, 76.9546327),
        infoWindow: InfoWindow(
          title: 'Бездомная собака',
          snippet: 'плохо видит и скулит',
        )));

    _markers.add(
      Marker(
          icon: mapMarker5,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Потоп',
            snippet: 'потоп',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker6,
          markerId: MarkerId('id-4'),
          position: LatLng(52.2484178, 76.9475304),
          infoWindow: InfoWindow(
            title: 'Бездомная кошка',
            snippet: 'плохо видит и скулит',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker5,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2502872, 76.9505888),
          infoWindow: InfoWindow(
            title: 'Свалка',
            snippet: 'после ветра ранесло',
          )),
    );
    _markers.add(Marker(
        icon: mapMarker4,
        markerId: MarkerId('id-8'),
        position: LatLng(52.2507743, 76.9449725),
        infoWindow: InfoWindow(
          title: 'Бездомная собака',
          snippet: 'скулит',
        )));
  }

  setMarkers() {
    _markers.add(
      Marker(
          icon: mapMarker1,
          markerId: MarkerId('id-1'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Мусор в неположенном месте',
            snippet: 'Пластиковые и бытовые отходы',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker2,
          markerId: MarkerId('id-2'),
          position: LatLng(52.2498763, 76.9514241),
          infoWindow: InfoWindow(
            title: 'Асфальтовая яма',
            snippet: 'тратуар сломан',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker3,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Потоп',
            snippet: 'потоп',
          )),
    );
    _markers.add(Marker(
        icon: mapMarker4,
        markerId: MarkerId('id-4'),
        position: LatLng(52.2504187, 76.9546327),
        infoWindow: InfoWindow(
          title: 'Бездомная собака',
          snippet: 'плохо видит и скулит',
        )));

    _markers.add(
      Marker(
          icon: mapMarker5,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Потоп',
            snippet: 'потоп',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker6,
          markerId: MarkerId('id-4'),
          position: LatLng(52.2484178, 76.9475304),
          infoWindow: InfoWindow(
            title: 'Бездомная кошка',
            snippet: 'плохо видит и скулит',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker5,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2502872, 76.9505888),
          infoWindow: InfoWindow(
            title: 'Свалка',
            snippet: 'после ветра ранесло',
          )),
    );
    _markers.add(Marker(
        icon: mapMarker4,
        markerId: MarkerId('id-8'),
        position: LatLng(52.2507743, 76.9449725),
        infoWindow: InfoWindow(
          title: 'Бездомная собака',
          snippet: 'скулит',
        )));

    return _markers;
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
        body: Stack(children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(lat, long), zoom: 12, bearing: 30, tilt: 80),
              zoomControlsEnabled: true,
              minMaxZoomPreference: MinMaxZoomPreference(15, 22),
              onMapCreated: _onMapCreated,
              markers: _markers,
              myLocationButtonEnabled: true,
            ),
          ),
          Positioned(top: 60, left: 0, right: 0, child: Container())
        ]),
        bottomNavigationBar: popped
            ? Container(
                width: _width,
                height: 275,
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
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Text(
                                  '$mapCity',
                                  style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.underline),
                                ),
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
                              onPressed: () => dropDown(),
                              icon: Icon(
                                Icons.keyboard_arrow_up_rounded,
                                size: 35,
                                color: grey,
                              )),
                        ],
                      ),
                      Container(
                        height: 173,
                        child: Row(children: [
                          Container(
                            width: _width * 0.572,
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: _width * 0.21,
                                            height: 42,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.25),
                                                      offset: Offset(2, 2))
                                                ],
                                                border: Border.all(
                                                    width: 1, color: grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: white),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/pins/trashcan.png',
                                              width: 20,
                                            ),
                                          )),
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: _width * 0.21,
                                            height: 42,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.25),
                                                      offset: Offset(2, 2))
                                                ],
                                                border: Border.all(
                                                    width: 1, color: grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: white),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/pins/drown.png',
                                              width: 20,
                                            ),
                                          )),
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: _width * 0.21,
                                            height: 42,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.25),
                                                      offset: Offset(2, 2))
                                                ],
                                                border: Border.all(
                                                    width: 1, color: grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: white),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/pins/road.png',
                                              width: 20,
                                            ),
                                          )),
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: _width * 0.21,
                                            height: 42,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.25),
                                                      offset: Offset(2, 2))
                                                ],
                                                border: Border.all(
                                                    width: 1, color: grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: white),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/pins/dog.png',
                                              width: 20,
                                            ),
                                          )),
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: _width * 0.21,
                                            height: 41,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.25),
                                                      offset: Offset(2, 2))
                                                ],
                                                border: Border.all(
                                                    width: 1, color: grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: white),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/pins/cat.png',
                                              width: 20,
                                            ),
                                          )),
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: _width * 0.21,
                                            height: 41,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.25),
                                                      offset: Offset(2, 2))
                                                ],
                                                border: Border.all(
                                                    width: 1, color: grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: white),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/pins/trash.png',
                                              width: 20,
                                            ),
                                          )),
                                    ]),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'Координаты',
                                style: TextStyle(fontSize: 15),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 23,
                                          width: 23,
                                          alignment: Alignment.center,
                                          child: Text('x',
                                              style: TextStyle(fontSize: 15)),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: grey))),
                                      Container(
                                        height: 23,
                                        width: 86,
                                        alignment: Alignment.center,
                                        child: Text('$_mapLat',
                                            style: TextStyle(fontSize: 15)),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    width: 1, color: grey),
                                                right: BorderSide(
                                                    width: 1, color: grey),
                                                bottom: BorderSide(
                                                    width: 1, color: grey))),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          height: 23,
                                          width: 23,
                                          alignment: Alignment.center,
                                          child: Text('y',
                                              style: TextStyle(fontSize: 15)),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      width: 1, color: grey),
                                                  left: BorderSide(
                                                      width: 1, color: grey),
                                                  bottom: BorderSide(
                                                      width: 1, color: grey)))),
                                      Container(
                                        height: 23,
                                        width: 86,
                                        alignment: Alignment.center,
                                        child: Text('$_mapLong',
                                            style: TextStyle(fontSize: 15)),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    width: 1, color: grey),
                                                bottom: BorderSide(
                                                    width: 1, color: grey))),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'PIN',
                                          style: TextStyle(
                                              fontSize: 24, color: black),
                                        ),
                                        Image.asset('assets/home/pin.png'),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              color: Colors.black
                                                  .withOpacity(0.25))
                                        ]),
                                    width: _width * 0.263,
                                    height: 78,
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '$mapCity',
                          style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            dropDown();
                          },
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

  List<Map> _cities = [
    {'id': '0', 'title': 'Алматы', "lat": '43.2567', 'lng': '76.9286'},
    {'id': '1', 'title': 'Нур-Султан', "lat": '51.1801', 'lng': '71.44598'},
    {'id': '2', 'title': 'Шымкент', "lat": '43.34168', 'lng': '69.5901'},
    {'id': '3', 'title': 'Актобе', "lat": '', 'lng': ''},
    {'id': '4', 'title': 'Караганда', "lat": '', 'lng': ''},
    {'id': '5', 'title': 'Тараз', "lat": '', 'lng': ''},
    {'id': '6', 'title': 'Павлодар', "lat": '', 'lng': ''},
    {'id': '7', 'title': 'Усть-Каменгорск', "lat": '', 'lng': ''},
    {'id': '8', 'title': 'Семей', "lat": '', 'lng': ''},
    {'id': '9', 'title': 'Атырау', "lat": '', 'lng': ''},
    {'id': '10', 'title': 'Костанай', "lat": '', 'lng': ''},
    {'id': '11', 'title': 'Кызылорда', "lat": '', 'lng': ''},
    {'id': '12', 'title': 'Уральск', "lat": '', 'lng': ''},
    {'id': '13', 'title': 'Актау', "lat": '', 'lng': ''},
    {'id': '14', 'title': 'Туркестан', "lat": '', 'lng': ''},
    {'id': '15', 'title': 'Кокшетау', "lat": '', 'lng': ''},
    {'id': '16', 'title': 'Талдыкорган', "lat": '', 'lng': ''},
  ];
}
