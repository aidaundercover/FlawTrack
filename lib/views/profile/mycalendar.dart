import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyCalendarPage extends StatelessWidget {
  const MyCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Events Calendar"),
        backgroundColor: Colors.transparent,
        leading: Builder(
        builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
      ),
      body: SfCalendar(
        view: CalendarView.month,
      ),
    );
  }
}
