import 'dart:io';
import 'package:flawtrack/widgets/maps/maps.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

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

  String searchAddr = "";
  bool popped = true;
  bool pinned = false;
  late BitmapDescriptor markerPin;
  late int indexg;
  bool draggablePin = true;
  late String tempId;
  double opReload = 0.5;
  bool pressRel = false;
  late Function()? takeaPhoto;
  late String? imagePath;
  late InfoWindow pinInfo;
  bool selected = false;
  late String pintitle;
  late TextEditingController pindesc;

  late String descTitle;
  late String descSnippet;

  // temporary//

  late String tempTitleDesc;
  late String tempDescDesc;
  late File tempImgDesc;

  // temporary//

  bool descVis = false;

  List<bool> isSelected = [false, false, false, false, false, false];

  File? image;
  String imageUrl = "";

  void _chooseCity() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(
          title: new Text('Қаланы таңданыз:'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Алматы';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Алматы'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Актобе';
                  lat = 50.273819;
                  long = 57.053706;
                });
                Navigator.pop(context);
              },
              child: const Text('Актобе'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Актау';
                  lat = 43.641492;
                  long = 51.1890056;
                });
                Navigator.pop(context);
              },
              child: const Text('Актау'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Атырау';
                  lat = 47.1037403;
                  long = 51.9077089;
                });
                Navigator.pop(context);
              },
              child: const Text('Атырау'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Қарағанды';
                  lat = 49.8157172;
                  long = 73.1079241;
                });
                Navigator.pop(context);
              },
              child: const Text('Қарағанды'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Көкшетау';
                  lat = 53.2981896;
                  long = 69.3380369;
                });
                Navigator.pop(context);
              },
              child: const Text('Көкшетау'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Қызылорда';
                  lat = 44.8281817;
                  long = 65.4350109;
                });
                Navigator.pop(context);
              },
              child: const Text('Қызылорда'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Қостанай';
                  lat = 53.2055331;
                  long = 63.5517867;
                });
                Navigator.pop(context);
              },
              child: const Text('Қостанай'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Нур-султан';
                  lat = 51.1480774;
                  long = 71.339307;
                });
                Navigator.pop(context);
              },
              child: const Text('Нур-султан'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Семей';
                  lat = 50.4130211;
                  long = 80.2054882;
                });
                Navigator.pop(context);
              },
              child: const Text('Семей'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Талдықорған';
                  lat = 45.0106102;
                  long = 78.354835;
                });
                Navigator.pop(context);
              },
              child: const Text('Талдықорған'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Тараз';
                  lat = 42.8962377;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Тараз'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Түркістан';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Түркістан'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Өскемен';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Өскемен'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Уральск';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Уральск'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Павлодар';
                  lat = 52.2535496;
                  long = 76.940024;
                });
                Navigator.pop(context);
              },
              child: const Text('Павлодар'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Петропавлск';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Петропавлск'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Шымкент';
                  lat = 42.3361304;
                  long = 69.5108012;
                });
                Navigator.pop(context);
              },
              child: const Text('Шымкент'),
            ),
          ],
        );
      },
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final temporaryImage = File(image.path);

      final _storage = FirebaseStorage.instance;

      var snapshot = await _storage
          .ref()
          .child('problems/$imageUrl')
          .putFile(temporaryImage);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });

      setState(() {
        this.image = temporaryImage;
      });
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: AppLocalizations.of(context).accesswasdenied);
    }
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text(AppLocalizations.of(context).camera),
                  onTap: () => pickImage(ImageSource.camera),
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text(AppLocalizations.of(context).gallery),
                  onTap: () => pickImage(ImageSource.gallery),
                )
              ],
            ));
  }

  Map<String, dynamic> dynamicMapToString(Map<dynamic, dynamic> data) {
    List<dynamic> _convertList(List<dynamic> src) {
      List<dynamic> dst = [];
      for (int i = 0; i < src.length; ++i) {
        if (src[i] is Map<dynamic, dynamic>) {
          dst.add(dynamicMapToString(src[i]));
        } else if (src[i] is List<dynamic>) {
          dst.add(_convertList(src[i]));
        } else {
          dst.add(src[i]);
        }
      }
      return dst;
    }

    Map<String, dynamic> retval = {};
    for (dynamic key in data.keys) {
      if (data[key] is Map<dynamic, dynamic>) {
        retval[key.toString()] = dynamicMapToString(data[key]);
      } else if (data[key] is List<dynamic>) {
        retval[key.toString()] = _convertList(data[key]);
      } else {
        retval[key.toString()] = data[key];
      }
    }
    return retval;
  }

  @override
  void initState() {
    super.initState();
    setFixedMarker();
    Geolocator.getCurrentPosition().then((currloc) {
      setState(() {
        dropDown();
        currentLocation = currloc;
      });
    });
  }


  void _onMapCreated(GoogleMapController controller) {
    _markers.add(
      Marker(
          icon: fixedMarker,
          markerId: MarkerId('id-1'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Мусор в неположенном месте',
            snippet: 'Пластиковые и бытовые отходы',
          )),
    );
    _markers.add(
      Marker(
          icon: fixedMarker,
          markerId: MarkerId('id-2'),
          position: LatLng(52.2498763, 76.9514241),
          infoWindow: InfoWindow(
            title: 'Асфальтовая яма',
            snippet: 'тратуар сломан',
          )),
    );
    _markers.add(
      Marker(
          icon: fixedMarker,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Түзетілді',
            snippet: 'Түзетілді',
          )),
    );
    _markers.add(Marker(
        icon: fixedMarker,
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
        child: const Icon(Icons.pin_drop, color: white),
      ),
      body: Stack(
        children: [
          Scaffold(
            bottomNavigationBar: Container(
              width: widthGlobal,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: white,
              ),
              child: Container(
                width: widthGlobal * 0.898,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              mapCity.isEmpty
                                  ? '${cityGlobal.toString()}'
                                  : '$mapCity',
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                _chooseCity();
                              },
                              icon: Icon(
                                Icons.edit_location_alt,
                                size: 25,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
              onTap: handleTap,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                  child: Text('Түзетуліер тарихы',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {
                                      dropDown();
                                    },
                                    icon: Icon(Icons.close,
                                        size: 25, color: black)),
                              )
                            ],
                          ),
                          SingleChildScrollView(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Бүгін',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/pins/dog.png',
                                    height: 10.0,
                                  ),
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
                                  Image.asset(
                                    'assets/pins/trashcan.png',
                                    height: 10.0,
                                  ),
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
                                  Image.asset(
                                    'assets/pins/dog.png',
                                    height: 10.0,
                                  ),
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
                                  Image.asset(
                                    'assets/pins/dog.png',
                                    height: 10.0,
                                  ),
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
                                  Image.asset(
                                    'assets/pins/dog.png',
                                    height: 10.0,
                                  ),
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
                                  Image.asset(
                                    'assets/pins/dog.png',
                                    height: 10.0,
                                  ),
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

  handleTap(LatLng tappedPoint) {
    setState(() {
      tempId = tappedPoint.toString();
      // problem = Problem(
      //   lat: tappedPoint.latitude,
      //   long: tappedPoint.longitude,
      //   mapMarker: mapMarkerInverse(markerPin),
      //   user: FirebaseAuth.instance.currentUser!.uid,
      // );
      markers.add(
        Marker(
          icon: fixedMarker,
          markerId: MarkerId(tempId),
          position: tappedPoint,
        ),
      );
    });
  }
}
