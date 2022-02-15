
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

Widget weatherOftheDay(String dayOfWeek, double width, int humidity, IconData icons,
    String nightTemp, String dayTemp) {
  return Padding(
    padding: const EdgeInsets.only(top:10.0),
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
            Icon(Icons.invert_colors_rounded, size: 8, color: acquaMarine,),
            
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Text('${humidity.toString()}' + '%',
                  style: TextStyle(
                    color: acquaMarine,
                    fontSize: 8,
                    fontWeight: FontWeight.w500
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(icons, size: 14,color: white,),
            ),
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
