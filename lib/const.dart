import 'dart:io';

import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(244, 146, 2, 1.0);
const white = Color.fromRGBO(255, 255, 255, 1.0);
const black = Color.fromRGBO(0, 0, 0, 1.0);
const yellow = Color.fromRGBO(250, 231, 156, 1.0);
const brightYellow = Color.fromRGBO(255, 219, 75, 1.0);
const lightYellow = Color.fromRGBO(255, 251, 234, 1.0);
const acquaMarine = Color.fromRGBO(142, 238, 221, 1.0);
const grey = Color.fromRGBO(0, 0, 0, 0.6);
const divider = Color.fromRGBO(232, 232, 232, 1);
const darkBlue = Color.fromRGBO(63, 61, 86, 1);

var widthGlobal;
late int lang;

bool visibleV = false;

bool volunteer = false;
String nameGlobal = "";
String email = "";
late File imgProfile;

var points = 0;
var pins = 4;

var name;

String mapCity = "";
var addressGlobal;
var cityGlobal = 'Павлодар';
var lat = 52.2535496;
var long = 76.940024;

