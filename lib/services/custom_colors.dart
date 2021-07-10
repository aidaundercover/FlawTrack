import 'package:flutter/material.dart';

class CustomColors {
  late Brightness brightness;
  late Color text1, primary;

  CustomColors(Brightness brightness) {
    this.brightness = brightness;

    if(brightness == Brightness.dark) {
      this.text1 = Color(0xff000001);
      this.primary = Color(0xffF49202);

    } else {
      this.text1 = Colors.white;
      this.primary = Color(0xffF49202);
    }
  }

}
