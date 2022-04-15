import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flawtrack/widgets/maps/maps.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  final ref = FirebaseDatabase.instance.ref();
  final _storage = FirebaseStorage.instance;

  late GoogleMapController controller;
  Set<Marker> markers = <Marker>{};
  bool pinPressed = false;
  List<XFile> problemImages = [];
  List<dynamic> problemImagesUrls = [];

  bool wasCancelled = false;

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

  @override
  void initState() {
    super.initState();
    setFixedMarker();
    setCustomMaker();
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
        onPressed: () {
          _chooseCity();
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.pin_drop, color: white),
      ),
      body: StreamBuilder(
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
                                          nextMarker['mapMarker'], context)),
                                      Text(nextMarker['desc']),
                                      Image.network(nextMarker['image'],
                                          width: 260, height: 400),
                                      Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                FirebaseDatabase.instance
                                                    .ref(
                                                        'problems/${nextMarker['id']}')
                                                    .remove();
                                              },
                                              child: Container(
                                                  child: Text("Исправить")))
                                        ],
                                      )
                                    ])),
                              ));
                    });
                markers.add(mapre);
              });

              return GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(lat, long), zoom: 12, bearing: 30, tilt: 80),
                zoomControlsEnabled: true,
                minMaxZoomPreference: MinMaxZoomPreference(15, 22),
                onMapCreated: _onMapCreated,
                markers: markers,
                myLocationButtonEnabled: true,
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller = controller;
    });

    setCustomMaker();
  }
}
