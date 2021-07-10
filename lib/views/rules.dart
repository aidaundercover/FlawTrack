import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/routes.dart';

class UsingRules extends StatelessWidget {
  const UsingRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          'Правила использования',
          style: TextStyle(
              color: black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.homeCitizen);
            },
          ),
        ),
      ),
    );
  }
}
