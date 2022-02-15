
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';


late BitmapDescriptor mapMarker1;
late BitmapDescriptor mapMarker2;
late BitmapDescriptor mapMarker3;
late BitmapDescriptor mapMarker4;
late BitmapDescriptor mapMarker5;
late BitmapDescriptor mapMarker6;
late BitmapDescriptor mapMarker7;

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

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
      ImageConfiguration(size: Size(50, 50)), 'assets/pins/cat.png');
}


