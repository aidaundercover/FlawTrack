import 'package:flawtrack/views/home_view/events.dart';
import 'package:flutter/material.dart';

import '../const.dart';


Widget eventsWidget(BuildContext context) {

  return InkWell(
    onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventsCalendar()));
      },
    child: Container(
      decoration: BoxDecoration(
        color: brightYellow,
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
        children: [
          Image.asset(''),
          Text('События', 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
          )
      ],),
    ),
  );

}