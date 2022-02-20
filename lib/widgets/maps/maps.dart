import 'dart:io';

import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flawtrack/views/maps/maps_of_problems.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

late BitmapDescriptor mapMarker1;
late BitmapDescriptor mapMarker2;
late BitmapDescriptor mapMarker3;
late BitmapDescriptor mapMarker4;
late BitmapDescriptor mapMarker5;
late BitmapDescriptor mapMarker6;
late BitmapDescriptor mapMarker7;

Set<Marker> markers = {};
late String tempId;
late String problemTile;

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

List<String> iconList = [
  'assets/pins/trashcan.png',
  'assets/pins/cat.png',
  'assets/pins/road.png',
  'assets/pins/dog.png',
  'assets/pins/trash.png',
  'assets/pins/drown.png'
];

void setCustomMaker() async {
  mapMarker1 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)), 'assets/pins/road.png');
  mapMarker2 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)), 'assets/pins/trashcan.png');
  mapMarker3 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)), 'assets/pins/drown.png');
  mapMarker4 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)), 'assets/pins/dog.png');
  mapMarker5 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)), 'assets/pins/trash.png');
  mapMarker6 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)), 'assets/pins/cat.png');
  mapMarker7 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)), 'assets/pins/homeless.png');
}

mapMarker(int n) {
  switch (n) {
    case 1:
      {
        return mapMarker1;
      }
    case 2:
      {
        return mapMarker2;
      }
    case 3:
      {
        return mapMarker3;
      }
    case 4:
      return mapMarker4;
    case 5:
      return mapMarker5;
    case 6:
      return mapMarker6;
    case 7:
      return mapMarker7;
  }
}

mapMarkerInverse(BitmapDescriptor n) {
  if (n ==  mapMarker1) return 1;
  if (n ==  mapMarker2) return 2;
  if (n ==  mapMarker3) return 3;
  if (n ==  mapMarker4) return 4;
  if (n ==  mapMarker5) return 5;
  if (n ==  mapMarker6) return 6;
  if (n ==  mapMarker7) return 7;
}

markerType(int n, BuildContext context) {
  switch (n) {
    case 1:
      {
        return AppLocalizations.of(context).road;
      }
    case 2:
      {
        return AppLocalizations.of(context).trashcan;
      }
    case 3:
      {
        return AppLocalizations.of(context).drown;
      }
    case 4:
      return AppLocalizations.of(context).dog;
    case 5:
      return AppLocalizations.of(context).trash;
    case 6:
      return AppLocalizations.of(context).cat;
    case 7:
      return AppLocalizations.of(context).homeless;
  }
}

timeExpired(double width, void func, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: width * 0.8,
            height: 300,
            child: Column(
              children: [
                Text('Your time for pinning details of problem is expired'),
                Container(
                  width: width * 0.76,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              func;
                            },
                            child: Text('Add'),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          TextButton(
                            onPressed: () {
                              markers.remove(tempId);
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
        );
      });
}

void descCardShow(String title, String desc, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: widthGlobal * 0.8,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => MapsOfProblems()));
                            },
                            icon: Icon(Icons.close, color: grey)),
                      )
                    ],
                  ),
                  Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  SizedBox(height: 10),
                  Text(desc,
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  // Container(child: Image.file(img) ??),
                ],
              ),
            ),
          ),
        );
      });
}
