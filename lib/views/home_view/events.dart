import 'package:flutter/material.dart';

import '../../const.dart';

class EventsCalendar extends StatefulWidget {
  const EventsCalendar({Key? key}) : super(key: key);

  @override
  _EventsCalendarState createState() => _EventsCalendarState();
}

class _EventsCalendarState extends State<EventsCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: primaryColor,
        title: Text(
          "Календарь событий",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.chevron_left_outlined, size: 35, color: black),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/')
                )
              ),
            ),
            Container(
              decoration: BoxDecoration()
            )
          ]
        )
      ),
    );
  }
}
