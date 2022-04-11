
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
String loginType = "usual";
late int lang;

bool visibleV = false;

bool volunteer = false;
String nameGlobal = "";
String email = "";
String photoUrlGlobal = "";
String uid = "";

var points = 0;
var pins = 0;

var name;

String mapCity = "";
var addressGlobal;
var cityGlobal = 'Павлодар';
var lat = 52.2535496;
var long = 76.940024;

String refEventCity = "";


List events = [
  [
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    }
  ],
  [
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    }
  ],
  [
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    }
  ],
  [
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    }
  ],
  [
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    }
  ],
  [
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    }
  ],
  [
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    }
  ],
  [
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    },
    {
      "title": "Субботник у Айтматова",
      "imgUrl":
          "https://miro.medium.com/max/1200/1*5r8b4M0dhRoAT_s_zgokqw.jpeg",
      "description": "встречаемся у памятника Абая",
      "color": Colors.amber,
    }
  ],
];
