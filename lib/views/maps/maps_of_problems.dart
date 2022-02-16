import 'package:dotted_border/dotted_border.dart';
import 'package:flawtrack/const.dart';
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
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  bool popped = true;
  String _mapLat = lat.toString();
  String _mapLong = long.toString();
  bool pinned = false;
  BitmapDescriptor markerPin = mapMarker1;
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

  List<bool> isSelected = [false, false, false, false, false, false];
  List<String> iconList = [
    'assets/pins/trashcan.png',
    'assets/pins/cat.png',
    'assets/pins/road.png',
    'assets/pins/dog.png',
    'assets/pins/trash.png',
    'assets/pins/drown.png'
  ];

  List<String> _images = [];

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final temporaryImage = File(image.path);

      setState(() {
        this.image = temporaryImage;
      });
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: 'Access to camera was denied');
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
                  title: Text('Camera'),
                  onTap: () => pickImage(ImageSource.camera),
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Gallery'),
                  onTap: () => pickImage(ImageSource.gallery),
                )
              ],
            ));
  }

  @override
  void initState() {
    super.initState();
    setCustomMaker();
    dropDown();
    pin();
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
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Көкшетау'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Қызылорда';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Қызылорда'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Қостанай';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Қостанай'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Нур-султан';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Нур-султан'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Семей';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Семей'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Талдықорған';
                  lat = 43.2290871;
                  long = 76.9137495;
                });
                Navigator.pop(context);
              },
              child: const Text('Талдықорған'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  mapCity = 'Тараз';
                  lat = 43.2290871;
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
                  lat = 43.2290871;
                  long = 76.9137495;
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

  void _showPhoto() {}

  void _onMapCreated(GoogleMapController controller) {
    markers.add(
      Marker(
          icon: mapMarker2,
          markerId: MarkerId('id-1'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Орынды емес қоқыс',
            snippet: 'Пластикалық және тұрмыстық қалдықтар',
          ),
          onTap: () {}),
    );
    markers.add(
      Marker(
          icon: mapMarker1,
          markerId: MarkerId('id-2'),
          position: LatLng(52.2498763, 76.9514241),
          infoWindow: InfoWindow(
            title: 'Асфальт шұңқыры',
            snippet: 'тратуар сынған',
          )),
    );
    markers.add(
      Marker(
          icon: mapMarker3,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Су тасқыны',
            snippet: 'потоп',
          )),
    );
    markers.add(Marker(
        icon: mapMarker4,
        markerId: MarkerId('id-4'),
        position: LatLng(52.2504187, 76.9546327),
        infoWindow: InfoWindow(
          title: 'Жоғалған ит',
          snippet: 'нашар көреді және сыбырлайды',
        )));

    markers.add(
      Marker(
          icon: mapMarker5,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2537144, 76.9424712),
          infoWindow: InfoWindow(
            title: 'Су тасқыны',
            snippet: 'потоп',
          )),
    );
    markers.add(
      Marker(
          icon: mapMarker6,
          markerId: MarkerId('id-4'),
          position: LatLng(52.2484178, 76.9475304),
          infoWindow: InfoWindow(
            title: 'Үйсіз мысық',
            snippet: 'плохо видит и скулит',
          )),
    );
    markers.add(
      Marker(
          icon: mapMarker5,
          markerId: MarkerId('id-3'),
          position: LatLng(52.2502872, 76.9505888),
          infoWindow: InfoWindow(
            title: 'Свалка',
            snippet: 'после ветра ранесло',
          )),
    );
    markers.add(Marker(
        icon: mapMarker4,
        markerId: MarkerId('id-8'),
        position: LatLng(52.2507743, 76.9449725),
        infoWindow: InfoWindow(
          title: 'Үйсіз ит',
          snippet: 'аш және жаралған',
        )));
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

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
                markers: markers,
                myLocationButtonEnabled: true,
                onTap: selected ? handleTap : dont),
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
                            width: _width * 0.572,
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
                                                pintitle = 'Үйсз ит';
                                                print('1');
                                              }
                                              break;
                                            case 2:
                                              {
                                                markerPin = mapMarker1;
                                                pintitle = 'Үйсз ит';
                                                print('2');
                                              }
                                              break;
                                            case 3:
                                              {
                                                markerPin = mapMarker4;
                                                pintitle = 'Үйсз ит';
                                                print('3');
                                              }
                                              break;
                                            case 4:
                                              {
                                                markerPin = mapMarker5;
                                                pintitle = 'Үйсз ит';
                                                print('4');
                                              }
                                              break;
                                            case 5:
                                              {
                                                markerPin = mapMarker3;
                                                pintitle = 'Үйсз ит';
                                                print('5');
                                              }
                                              break;
                                            case 0:
                                              {
                                                markerPin = mapMarker2;
                                                pintitle = 'Үйсз ит';
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
                                onPressed: () {
                                  pinned = true;
                                  if (selected) addInfo();
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
                                    width: _width * 0.263,
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

  ///handle pining

  // handleTap(LatLng tappedPoint) {
  //   setState(() {
  //     tempId = tappedPoint.toString();
  //     if (selected) {
  //       markers.add(Marker(
  //         onTap: () {},
  //         markerId: MarkerId(tappedPoint.toString()),
  //         position: tappedPoint,
  //         icon: markerPin,
  //         infoWindow: pintitle.isNotEmpty ? pinInfo : InfoWindow.noText,
  //       ));
  //     } else
  //       Fluttertoast.showToast(
  //         msg: "Select type of problem",
  //       );
  //   });
  // }

  handleTap(LatLng tappedPoint) {
    setState(() {
      tempId = tappedPoint.toString();
      markers.add(Marker(
        icon: markerPin,
        onTap: () {},
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
        // infoWindow: pintitle.isNotEmpty ? pinInfo : InfoWindow.noText,
      ));
    });
  }

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
            'OK',
            style: TextStyle(
              fontSize: 13,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          pinInfo = InfoWindow(title: pintitle, snippet: pindesc.text);
          pin();
          selected = false;
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
                          onSaved: (newValue) => pindesc.text = newValue!,
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
                              width: widthGlobal*0.74,
                              height: 80,
                              fit: BoxFit.cover)
                          : DottedBorder(
                              child: Container(
                                  height: 50,
                                  width:
                                    widthGlobal*0.74,
                                  decoration: BoxDecoration(
                                      color: grey.withOpacity(0.7)),
                                  child: IconButton(
                                      onPressed: () {
                                        showImageSource(context);
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
