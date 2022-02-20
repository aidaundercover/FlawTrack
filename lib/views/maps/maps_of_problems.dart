import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flawtrack/const.dart';
import 'package:flawtrack/models/Problem.dart';
import 'package:flawtrack/pages.dart';
import 'package:flawtrack/splash.dart';
import 'package:flawtrack/views/error/smth_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flawtrack/widgets/maps/maps.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MapsOfProblems extends StatefulWidget {
  const MapsOfProblems({Key? key}) : super(key: key);

  @override
  _MapsOfProblemsState createState() => _MapsOfProblemsState();
}

class _MapsOfProblemsState extends State<MapsOfProblems> {
  Set<Marker> markers = <Marker>{};
  late GoogleMapController controller;
  String searchAddr = "";
  bool popped = true;
  String _mapLat = lat.toString();
  String _mapLong = long.toString();
  bool pinned = false;
  late BitmapDescriptor markerPin;
  late int indexg;
  bool draggablePin = true;
  late String tempId;
  double opReload = 0.5;
  bool pressRel = false;
  late Function()? takeaPhoto;
  late String? imagePath;
  Problem problem = Problem();
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
    setCustomMaker();
    dropDown();
    pin();
    pressReload();
    loadMap(context);
    setMarkers();
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

  void pin() {
    setState(() {
      pinned = !pinned;
    });
  }

  void descriptionVisible() {
    setState(() {
      descVis = !descVis;
    });
  }

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

  setMarkers() {
    return markers;
  }

  void _onMapCreated(GoogleMapController controller) {
    controller = controller;
  }

  Widget loadMap(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('problems').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }

        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          markers.add(Marker(
              position: LatLng(snapshot.data!.docs[i]['lat'],
                  snapshot.data!.docs[i]['long']),
              markerId: MarkerId(snapshot.data!.docs[i].toString()),
              icon: mapMarker(snapshot.data!.docs[i]['mapMarker']),
              onTap: () {
                setState(() {
                  descCardShow(
                      markerType(snapshot.data!.docs[i]['mapMarker'], context),
                      snapshot.data!.docs[i]['details']['description'],
                      context);
                });
              }));
        }
        return GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(lat, long), zoom: 12, bearing: 30, tilt: 80),
            zoomControlsEnabled: true,
            minMaxZoomPreference: MinMaxZoomPreference(15, 22),
            onMapCreated: _onMapCreated,
            markers: markers,
            myLocationButtonEnabled: true,
            onTap: selected ? handleTap : dont);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    widthGlobal = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: primaryColor,
          title: Text(
            AppLocalizations.of(context).mapsp,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: black),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.chevron_left_outlined, size: 35, color: black),
                onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Maps()))),
          ),
        ),
        body: Stack(children: [
          loadMap(context),
          Positioned(
            top: 30.0,
            right: 15.0,
            left: 15.0,
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
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
          ),
          Positioned(top: 60, left: 0, right: 0, child: Container())
        ]),
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
                                primary: true,
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children:
                                    List.generate(isSelected.length, (index) {
                                  return InkWell(
                                      splashColor:
                                          primaryColor, //the default splashColor is grey
                                      onTap: () {
                                        setState(() {
                                          switch (index) {
                                            case 1:
                                              {
                                                markerPin = mapMarker6;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .cat;
                                                print('');
                                              }
                                              break;
                                            case 2:
                                              {
                                                markerPin = mapMarker1;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .road;
                                                print('2');
                                              }
                                              break;
                                            case 3:
                                              {
                                                markerPin = mapMarker4;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .dog;
                                                print('3');
                                              }
                                              break;
                                            case 4:
                                              {
                                                markerPin = mapMarker5;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .trash;
                                                print('4');
                                              }
                                              break;
                                            case 5:
                                              {
                                                markerPin = mapMarker3;
                                                pintitle =
                                                    AppLocalizations.of(context)
                                                        .drown;
                                                print('5');
                                              }
                                              break;
                                            case 0:
                                              {
                                                markerPin = mapMarker2;
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
                                          width: widthGlobal * 0.21,
                                          height: 42,
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
                                  pinned = true;
                                  if (selected) {
                                    addInfo();
                                    FirebaseFirestore.instance
                                        .collection('problems')
                                        .doc()
                                        .set(problem.toMap());
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

  handleTap(LatLng tappedPoint) {
    setState(() {
      tempId = tappedPoint.toString();
      problem = Problem(
        lat: tappedPoint.latitude,
        long: tappedPoint.longitude,
        mapMarker: mapMarkerInverse(markerPin),
        user: FirebaseAuth.instance.currentUser!.uid,
      );
      markers.add(
        Marker(
          icon: markerPin,
          onTap: () {
            descCardShow(pintitle, '', context);
          },
          markerId: MarkerId(tempId),
          position: tappedPoint,
        ),
      );

      Future.delayed(const Duration(seconds: 7), () {
        if (pinned) {
        } else
          timeExpired(MediaQuery.of(context).size.width, addInfo(), context);
      });
    });
  }

  searchandNavigate() {}

  void addInfo() {
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
          markers.remove(tempId);
          pinned = false;
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
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MapsOfProblems()));
          pinInfo = InfoWindow(title: pintitle, snippet: pindesc.text);
          pin();
          selected = false;
          pinned = false;
        },
      );
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: image != null ? 450 : 320,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
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
                          onSaved: (newValue) {
                            pindesc.text = newValue!;
                            problem.details!['desc'] = pindesc.text;
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
                      image != null
                          ? Image.file(image!,
                              width: widthGlobal * 0.74,
                              height: 150,
                              fit: BoxFit.cover)
                          : DottedBorder(
                              child: Container(
                                  height: 50,
                                  width: widthGlobal * 0.74,
                                  decoration: BoxDecoration(
                                      color: grey.withOpacity(0.7)),
                                  child: IconButton(
                                      onPressed: () {
                                        showImageSource(context);
                                        problem.details!['img'] = imageUrl;
                                      },
                                      icon: Icon(Icons.add_a_photo))),
                            )
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

  dont(LatLng tappedPoint) {
    Fluttertoast.showToast(
      msg: "Select type of problem",
    );
  }
}


// getMarkerData() async {
//     FirebaseFirestore.instance.collection('problems').get().then((myMarkers) {
//       if (myMarkers.docs.isNotEmpty) {
//         for (int i = 0; i < myMarkers.docs.length; i++) {
//           initMarker(myMarkers.docs[i].data, myMarkers.docs[i].id);
//         }
//       }
//     });
//   }

//   void initMarker(specify, specifyId) async {
//     var markerIdVal = specifyId;
//     final MarkerId markerId = MarkerId(markerIdVal);
//     final Marker marker = Marker(
//         markerId: markerId,
//         position: LatLng(specify['lat'], specify['long']),
//         onTap: () {
//           descCardShow(markerType(specify['mapMarker'], context),
//               specify['details']['description'], context);
//         });
//     setState(() {
//       markers[markerId] = marker;
//     });
//   }
