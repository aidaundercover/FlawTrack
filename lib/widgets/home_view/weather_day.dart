
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

Widget weatherOftheDay(String dayOfWeek, double width, int humidity, IconData icons,
    String nightTemp, String dayTemp) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    child: Container(
      child: Row(
        children: [
          Container(
            width: width,//0.3 от половины,
            child: Text(dayOfWeek,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w500,
              fontSize: 11
            ),
            ),
          ),
          Icon(Icons.water, size: 8, color: acquaMarine,),
          Text('$humidity' + '%',
              style: TextStyle(
                color: acquaMarine,
                fontSize: 8,
                fontWeight: FontWeight.w500
              ),
          ),
          Icon(icons, size: 14,color: white,),
          Text('$nightTemp'+'°/ '+'$dayTemp'+'°',
              style: TextStyle(
                color: white,
                fontSize: 11,
                fontWeight: FontWeight.w500
              ),
          )
      ],),
    ),
  );
}
