import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flawtrack/const.dart';
import 'package:flawtrack/home_widget_citizen.dart';
import 'package:flawtrack/home_widget_volunteer.dart';
import 'package:flutter/material.dart';
import "dart:async";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flawtrack/widgets/maps/maps.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class MapsOfProblems extends StatefulWidget {
  const MapsOfProblems({Key? key}) : super(key: key);

  @override
  _MapsOfProblemsState createState() => _MapsOfProblemsState();
}

class _MapsOfProblemsState extends State<MapsOfProblems> {
  final ref = FirebaseDatabase.instance.ref();
  final _storage = FirebaseStorage.instance;

  late GoogleMapController controller;
  String searchAddr = "";
  Set<Marker> markers = <Marker>{};
  bool popped = true;
  String _mapLat = lat.toString();
  String _mapLong = long.toString();
  bool pinned = false;
  late BitmapDescriptor markerPin;
  bool draggablePin = true;
  late String tempId;

  double opReload = 0.5;
  bool pressRel = false;
  bool selected = false;
  TextEditingController pindesc = TextEditingController();
  bool pinPressed = false;
  List<XFile> problemImages = [];
  List<dynamic> problemImagesUrls = [];

  bool wasCancelled = false;

  // temporary//

  late LatLng tempPoinf;
  late String pintitle = "";
  late int pintitleN;

  bool isSearch = false;

  List<bool> isSelected = [false, false, false, false, false, false];

  showImageSource(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text(AppLocalizations.of(context).camera),
                  onTap: () => pickImageCamera(),
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text(AppLocalizations.of(context).gallery),
                  onTap: () => pickImageGallery(),
                )
              ],
            ));
  }

  Future _addImage(XFile _image) async {
    setState(() {
      problemImages.add(_image);
    });
  }

  pickImageCamera() async {
    try {
      XFile? tempImg =
          await ImagePicker().pickImage(source: ImageSource.camera);
      tempImg?.path != null
          ? _addImage(tempImg!)
          : Fluttertoast.showToast(msg: "rrr");
    } catch (e) {
      Fluttertoast.showToast(msg: AppLocalizations.of(context).accesswasdenied);
    }
  }

  pickImageGallery() async {
    try {
      List<XFile> _problemImages = (await ImagePicker().pickMultiImage())!;
      for (int i = 0; i < _problemImages.length; i++) {
        _addImage(_problemImages[i]);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: AppLocalizations.of(context).accesswasdenied);
    }
  }

  @override
  void initState() {
    setCustomMaker();
    dropDown();
    pressReload();
    super.initState();
  }

  void dropDown() {
    setState(() {
      popped = !popped;
    });
  }

  void pressReload() {
    setState(() {
      pressRel = true;
    });
  }

  void cancelPressed() {
    setState(() {
      pressRel = true;
    });
  }

  void pin() {
    setState(() {
      pinned = true;
    });
  }

  void pinPress() {
    setState(() {
      pinPressed = true;
    });
  }

  void _chooseCity() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
          child: SimpleDialog(
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
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 8.0),
                    //   child: Icon(Icons.apple),
                    // ),
                    const Text('Алматы'),
                  ],
                ),
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
          ),
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller = controller;
    });

    setCustomMaker();
  }

  @override
  Widget build(BuildContext context) {
    widthGlobal = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(children: [
          StreamBuilder(
              stream: ref.child('problems').onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData) {
                  final myMaps = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
                  myMaps.forEach((key, value) {
                    final nextMarker = Map<String, dynamic>.from(value);
                    final mapre = Marker(
                        markerId: MarkerId(nextMarker['id']),
                        position: LatLng(nextMarker['lat'], nextMarker['long']),
                        icon: mapMarker(nextMarker['mapMarker']),
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                    child: Container(
                                        width: 300,
                                        height: 600,
                                        child: Column(children: [
                                          Text(markerType(
                                              nextMarker['mapMarker'],
                                              context)),
                                          Text(nextMarker['desc']),
                                          Image.network(nextMarker['image'],
                                              width: 260, height: 400)
                                        ])),
                                  ));
                        });
                    markers.add(mapre);
                  });

                  return GoogleMap(
                      compassEnabled: false,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(lat, long),
                          zoom: 12,
                          bearing: 30,
                          tilt: 80),
                      zoomControlsEnabled: true,
                      minMaxZoomPreference: MinMaxZoomPreference(15, 22),
                      onMapCreated: _onMapCreated,
                      markers: markers,
                      myLocationButtonEnabled: true,
                      onTap: selected ? handleTap : dont);
                } else
                  return Center(child: CircularProgressIndicator());
              }),
          Positioned(
            top: 20.0,
            child: Container(
              width: widthGlobal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(2, 3),
                                  color: black.withOpacity(0.2),
                                  blurRadius: 5)
                            ]),
                        child: Center(
                          child: InkWell(
                            child: Icon(Icons.chevron_left_outlined,
                                size: 35, color: black),
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => volunteer
                                        ? HomeVolunteer()
                                        : HomeCitizen())),
                          ),
                        ),
                      ),
                    ),
                    Text(AppLocalizations.of(context).mapsp,
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2, 3),
                                    color: black.withOpacity(0.2),
                                    blurRadius: 5)
                              ]),
                          child: Center(
                            child: InkWell(
                                child:
                                    Icon(Icons.search, size: 25, color: black),
                                onTap: () {
                                  setState(() {
                                    isSearch = !isSearch;
                                  });
                                }),
                          )),
                    ),
                  ]),
            ),
          ),
          isSearch ? Positioned(
            top: 80.0,
            right: 15.0,
            left: 15.0,
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.8)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).enteraddress,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: searchandNavigate,
                            iconSize: 30.0)),
                    onChanged: (val) {
                      setState(() {
                        searchAddr = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ) : Positioned(top: 60, left: 0, right: 0, child: Container()),
          
        ]),
        extendBody: true,
        bottomNavigationBar: popped
            ? Container(
                width: widthGlobal,
                height: 275,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: white,
                ),
                child: Container(
                  width: widthGlobal * 0.898,
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
                            width: widthGlobal * 0.572,
                            child: Ink(
                              color: Colors.white,
                              child: GridView.count(
                                scrollDirection: Axis.horizontal,
                                primary: true,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children:
                                    List.generate(isSelected.length, (index) {
                                  return InkWell(
                                      splashColor: primaryColor,
                                      onTap: () {
                                        setState(() {
                                          switch (index) {
                                            case 1:
                                              {
                                                markerPin = mapMarker6;
                                                pintitleN = 6;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .cat;

                                                print('1');
                                              }
                                              break;
                                            case 2:
                                              {
                                                markerPin = mapMarker1;
                                                pintitleN = 1;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .road;
                                                print('2');
                                              }
                                              break;
                                            case 3:
                                              {
                                                markerPin = mapMarker4;
                                                pintitleN = 4;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .dog;
                                                print('3');
                                              }
                                              break;
                                            case 4:
                                              {
                                                markerPin = mapMarker5;
                                                pintitleN = 5;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .trash;
                                                print('4');
                                              }
                                              break;
                                            case 5:
                                              {
                                                markerPin = mapMarker3;
                                                pintitleN = 3;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .drown;
                                                print('5');
                                              }
                                              break;
                                            // case 6:
                                            //   {
                                            //     markerPin = mapMarker7;
                                            //     pintitle =
                                            //         AppLocalizations.of(context)
                                            //             .homeless;
                                            //     print('6');
                                            //   }
                                            // break;
                                            case 0:
                                              {
                                                markerPin = mapMarker2;
                                                pintitleN = 2;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .trashcan;
                                                print('0');
                                              }
                                              break;
                                          }
                                          for (int indexBtn = 0;
                                              indexBtn < isSelected.length;
                                              indexBtn++) {
                                            if (indexBtn == index) {
                                              selected = isSelected[indexBtn] =
                                                  !isSelected[indexBtn];
                                            } else {
                                              isSelected[indexBtn] = false;
                                            }
                                          }
                                        });
                                      },
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          color: isSelected[index]
                                              ? Color(0xffD6EAF8)
                                              : Colors.white,
                                          border: Border.all(color: Colors.red),
                                        ),
                                        child: Container(
                                          width: widthGlobal * 0.15,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.25),
                                                    offset: Offset(2, 2))
                                              ],
                                              border: Border.all(
                                                  width:
                                                      isSelected[index] ? 2 : 1,
                                                  color: isSelected[index]
                                                      ? primaryColor
                                                      : grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: white),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            iconList[index],
                                            width: 20,
                                          ),
                                        ),
                                      ));
                                }),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                AppLocalizations.of(context).coordinates,
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
                                onPressed: () {
                                  if (selected) {
                                    pinPress();
                                    addInfo(context);
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "Select type of problem",
                                    );
                                  }
                                },
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
                                              offset: pinned
                                                  ? Offset(0, 0)
                                                  : Offset(0, 4),
                                              color: pinned
                                                  ? Colors.transparent
                                                  : Colors.black
                                                      .withOpacity(0.25))
                                        ]),
                                    width: widthGlobal * 0.263,
                                    height: 78,
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(Icons.refresh_sharp,
                                  color: grey.withOpacity(opReload)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            super.widget));
                                pressReload();
                                pressRel = false;
                              })
                        ],
                      )
                    ],
                  )),
                ),
              )
            : Container(
                width: widthGlobal,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: widthGlobal*0.15,
                        height: 4,
                        decoration: BoxDecoration(
                            color: grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(3)
                        )
                      ),
                    ),
                    Row(
                      children:[
                        
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2, 3),
                                    color: black.withOpacity(0.2),
                                    blurRadius: 5)
                              ]),
                          child: Center(
                            child: InkWell(
                              child: Icon(Icons.location_city,
                                  size: 30, color: primaryColor),
                              onTap: () => _chooseCity()),
                            ),
                          ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        mapCity.isEmpty
                            ? '${cityGlobal.toString()}, Қазақстан' 
                            : '$mapCity, Қазақстан',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold
                           ),
                      ),
                    ),
                      
                    
                      ]
                    )
                    
                  ],
                ),
              ));
    // });
  }

  void delay() {
    Future.delayed(const Duration(seconds: 60), () {
      if (!pinPressed) {
        markers.remove(marker);
        showDialog(
            context: context,
            builder: (_) => Dialog(
                  child: Container(
                    width: widthGlobal * 0.8,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(4, 4),
                              color: black.withOpacity(0.3))
                        ]),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: widthGlobal * 0.76,
                            child: Text(
                                'Your time for pinning details of problem is expired'),
                          ),
                        ),
                        Container(
                          width: widthGlobal * 0.76,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      addInfo(context);
                                    },
                                    child: Text('Add'),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      markers.remove(marker);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ));
      }
    });
  }

  void handleTap(LatLng tappedPoint) {
    tempPoinf = tappedPoint;
    tempId = Uuid().v1();
    marker = Marker(
      icon: markerPin,
      markerId: MarkerId(tempId),
      position: tappedPoint,
    );
    setState(() {
      markers.add(marker);
      Fluttertoast.showToast(
        msg: "Add details to the problem",
      );
    });
    print("$pinned");
    wasCancelled ? dont(tappedPoint) : delay();
  }

  searchandNavigate() {}

  void addInfo(BuildContext context) {
    cancelButton(BuildContext context) {
      return TextButton(
        child: Container(
          width: 72,
          height: 24,
          color: Color.fromRGBO(246, 242, 242, 1),
          alignment: Alignment.center,
          child: Text(
            'Отмена',
            style: TextStyle(
              fontSize: 13,
              color: grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            problemImages.clear();
            pinPressed = false;
            cancelPressed();
            Future.delayed(Duration(minutes: 2), () {
              wasCancelled = false;
            });
          });
        },
      );
    }

    okButton(BuildContext context) {
      return TextButton(
        child: Container(
          width: 72,
          height: 24,
          color: primaryColor.withOpacity(0.6),
          alignment: Alignment.center,
          child: Text(
            'PIN',
            style: TextStyle(
              fontSize: 13,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onPressed: () async {
          try {
            for (int i = 0; i < problemImages.length; i++) {
              await _storage
                  .ref()
                  .child('/problems/$tempId')
                  .putFile(File(problemImages[i].path));

              // final myImages = List.from(_storage
              //     .ref()
              //     .child('/problems/$tempId') as List<dynamic>);

              // for (int i = 0; i < myImages.length; i++) {
              //   problemImagesUrls.add(_storage
              //     .ref()
              //     .child('/problems/$tempId').getDownloadURL());
              // }
            }

            await ref.child('/problems/$tempId').set({
              "id": tempId,
              "mapMarker": pintitleN,
              "lat": tempPoinf.latitude,
              "long": tempPoinf.longitude,
              "desc": pindesc.text,
              "user": FirebaseAuth.instance.currentUser!.uid,
              "timestamp": DateTime.now().toString(),
              "image": await _storage
                  .ref()
                  .child('/problems/$tempId')
                  .getDownloadURL()
            });

            await FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                int lastPinNumber = documentSnapshot.get(FieldPath(['pins']));
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({'pins': lastPinNumber + 1});
              } else {
                print('Document does not exist on the database');
              }
            });

            pin();

            setState(() {
              pinned = false;
              selected = false;
              wasCancelled = false;

              problemImages.clear();
              problemImagesUrls.clear();
            });

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MapsOfProblems()));
          } catch (e) {
            Fluttertoast.showToast(msg: "$e");
          }

          print('ok button was pressed');
        },
      );
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: problemImages.isNotEmpty ? 450 : 350,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Мәселеңіздін толығырақ \nашып жазыңыз',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.74,
                        child: TextFormField(
                          minLines: 3,
                          maxLines: 5,
                          onChanged: (newValue) => {
                            setState(() {
                              pindesc.text = newValue;
                            })
                          },
                          decoration: InputDecoration(
                              hintText: 'Мәселе сипаты/детальдер',
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey, width: 1))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      problemImages.isEmpty
                          ? DottedBorder(
                              child: Container(
                                  height: 50,
                                  width: widthGlobal * 0.74,
                                  decoration: BoxDecoration(
                                      color: grey.withOpacity(0.4)),
                                  child: IconButton(
                                      onPressed: () {
                                        showImageSource(context);
                                      },
                                      icon: Icon(Icons.add_a_photo))),
                            )
                          : Stack(
                              children: [
                                ListView(
                                  children:
                                      List.generate(problemImages.length, (i) {
                                    return Image.file(
                                        File(problemImages[i].path),
                                        width: widthGlobal * 0.74,
                                        height: 150,
                                        fit: BoxFit.cover);
                                  }),
                                  scrollDirection: Axis.horizontal,
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await showImageSource(context);
                                    },
                                    icon: Icon(Icons.add_a_photo))
                              ],
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.76,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          cancelButton(context),
                          SizedBox(
                            width: 18,
                          ),
                          okButton(context)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
        });
  }
}
