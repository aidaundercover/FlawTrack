import 'package:flawtrack/views/events/create_event.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

Widget createEventWidget(BuildContext context, double width) {
  return InkWell(
    onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEvent()));
      },
    child: Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Container(
        width: width,
        height: 113,
        decoration: BoxDecoration(
          color: Color.fromRGBO(91, 213, 221, 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
          ),
        ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Image.asset('assets/home/home_cloud_icon.png', width: 78,),
              Text('Іс-шара\n ұйымдастыру', 
                textAlign: TextAlign.center,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13
            ),
            )
        ],),
      ),
    ),
  );
}
