import 'package:flutter/material.dart';

class MyCalendarPage extends StatelessWidget {
  const MyCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Events Calendar"),
        backgroundColor: Colors.transparent,
        
      ),
    );
  }
}
