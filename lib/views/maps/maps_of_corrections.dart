import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsOfCorrections extends StatefulWidget {
  const MapsOfCorrections({Key? key}) : super(key: key);

  @override
  _MapsOfCorrectionsState createState() => _MapsOfCorrectionsState();
}

class _MapsOfCorrectionsState extends State<MapsOfCorrections> {
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;
  bool _toggled = false;
  var currentLocation;

  bool clientsToggle = false;
  bool resetToggle = false;

  var clients = [];

  var currentClient;
  var currentBearing;

  late GoogleMapController mapController;

 @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((currloc) {
      setState(() {
        dropDown();
        currentLocation = currloc;
      });
    });
  }




 
 

  void setCustomMaker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), 'assets/pins/fixed.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    _markers.add(
      Marker(
          icon: mapMarker,
          markerId: MarkerId('id-1'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Мусор в неположенном месте',
            snippet: 'Пластиковые и бытовые отходы',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker,
          markerId: MarkerId('id-2'),
          position: LatLng(52.2498763, 76.9514241),
          infoWindow: InfoWindow(
            title: 'Асфальтовая яма',
            snippet: 'тратуар сломан',
          )),
    );
    _markers.add(
      Marker(
          icon: mapMarker,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Түзетілді',
            snippet: 'Түзетілді',
          )),
    );
    _markers.add(Marker(
        icon: mapMarker,
        markerId: MarkerId('id-4'),
        position: LatLng(52.2504187, 76.9546327),
        infoWindow: InfoWindow(
          title: 'Түзетілді',
          snippet: 'Түзетілді',
        )));
  }

  void dropDown() {
    setState(() {
      _toggled = !_toggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add, color: white),
      ),
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: primaryColor,
              title: Text(
                "Түзетулер картасы",
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: black),
              ),
              centerTitle: true,
              leading: Builder(
                builder: (context) => IconButton(
                    icon: Icon(Icons.chevron_left_outlined,
                        size: 35, color: black),
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
                initialCameraPosition: CameraPosition(
                    target: LatLng(lat, long), zoom: 12, bearing: 30, tilt: 80),
                zoomControlsEnabled: true,
                minMaxZoomPreference: MinMaxZoomPreference(15, 22),
                onMapCreated: _onMapCreated,
                markers: _markers,
                myLocationButtonEnabled: true,
                ),
          ),
          Positioned(
              top: 40,
              right: 10,
              child: _toggled
                  ? Container(
                      width: 324,
                      height: 200,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text('Түзетуліер тарихы',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              IconButton(
                                  onPressed: () {
                                    dropDown();
                                  },
                                  icon:
                                      Icon(Icons.close, size: 25, color: black))
                            ],
                          ),
                          SingleChildScrollView(
                              child: Column(
                            children: [
                              Text('Бүгін',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  Image.asset('assets/pins/dog.png', height: 10.0,),
                                  Text('ул.Абая 14 исправлено Айдана Аркантар',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    '06:33',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/pins/trashcan.png', height: 10.0,),
                                  Text(
                                      'ул.Астана 124 исправлено Каракат Мугриса',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    '06:33',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/pins/dog.png', height: 10.0,),
                                  Text('ул.Eстая 256 исправлено Шырын Досжан',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    '07:13',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/pins/dog.png', height: 10.0,),
                                  Text('ул.Гагарина 49 исправлено Наталья Ким',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    '07:22',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/pins/dog.png', height: 10.0,),
                                  Text('ул.Абая 14 исправлено Айдана Аркантар',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    '06:33',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/pins/dog.png', height: 10.0,),
                                  Text('ул.Абая 14 исправлено Айдана Аркантар',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    '06:33',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: grey),
                                  )
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    )
                  : Container())
        ],
      ),
    );
  }

 
}
