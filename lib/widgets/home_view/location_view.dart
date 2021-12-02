import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

Widget locationView(double width) {
  return Container(
    width: width,
    height: 65,
    child: Row(
      children: [
        Expanded(
          child: Container(),
          flex: 1,
        ),
        Expanded(
          flex: 9,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 25, color: Colors.red),
              SizedBox(
                width: 3,
              ),
              Text(
                '${addressGlobal.toString()}',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
