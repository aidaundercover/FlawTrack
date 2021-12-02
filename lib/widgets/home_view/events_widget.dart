import 'package:flawtrack/views/events/events_calendar.dart';
import 'package:flutter/material.dart';

import '../../const.dart';


Widget eventsWidget(BuildContext context, double width) {

  return InkWell(
    onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventsCalendar()));
      },
    child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: width,
        height: 120,
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
            Image.asset('assets/home/home_event_icon.png', height: 80),
            Text('События', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),
            )
        ],),
      ),
    ),
  );

}