import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';


bool selected = false; 

Widget problemButton(BuildContext context, double width, String img) {
  
  return TextButton(
      onPressed: () {

      },
      child: Container(
        width: width * 0.21,
        height: 42,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors. black.withOpacity(0.25), offset: Offset(2, 2))
            ],
            border: Border.all(width: selected ? 2 : 1, color: selected ? primaryColor : grey),
            borderRadius: BorderRadius.circular(10),
            color: white),
        alignment: Alignment.center,
        child: Image.asset(
          img,
          width: 20,
        ),
      ));
}
