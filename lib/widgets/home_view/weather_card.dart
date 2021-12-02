import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/home_view/weather_day.dart';

Widget weather(double width) {
  return Padding(
    padding: const EdgeInsets.only(top: 25),
    child: Container(
      height: 150,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/weather_bc.png'),
          fit: BoxFit.cover
          ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex:1,
            child: Container(
              height: 96,
              child: Column(
                children: [
                  Center(
                    child: Row(children: [
                      Icon(Icons.wb_cloudy, size: 45, color: white,),
                      Text('1' + '°',
                        style: TextStyle(color: white, fontSize: 35),
                      )
                    ],),
                  ),
                  Text('Переменная облачность',
                      style: TextStyle(
                        color: white,
                        fontSize: 8,
                      ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Погода',
                      style: TextStyle(
                        color: white, 
                        fontSize: 26,
                        fontWeight: FontWeight.w500
                        ),
                      ),
                      Text('Вт'+', '+'2 ноября',
                      style: TextStyle(
                        color: white, 
                        fontSize: 9,
                        fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  )
                ],
                ),
            )),
          Expanded(
            flex:1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                weatherOftheDay('Среда', width, 10, Icons.wb_cloudy_rounded, '-8', '-13'),
                weatherOftheDay('Четверг', width, 10, Icons.wb_cloudy_rounded, '-4', '-14'),
                weatherOftheDay('Пятница', width, 10, Icons.wb_sunny, '1', '-8'),
                weatherOftheDay('Суббота', width, 10, Icons.wb_cloudy_rounded, '2', '-6'),
                weatherOftheDay('Воскресенье', width, 10, Icons.wb_cloudy_rounded, '6', '-3'),
              ],
              ))
        ],),
    ),
  );
}
