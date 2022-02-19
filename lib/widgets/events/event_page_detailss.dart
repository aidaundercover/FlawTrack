import 'package:flutter/material.dart';

import '../../const.dart';

class EventPageTemplate extends StatefulWidget {
  final String title;
  const EventPageTemplate({required this.title});

  @override
  _EventPageTemplateState createState() => _EventPageTemplateState();
}

class _EventPageTemplateState extends State<EventPageTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
