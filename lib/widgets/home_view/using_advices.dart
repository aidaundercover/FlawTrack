import 'package:flawtrack/views/rules.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

Widget usingAdvice(BuildContext context, double width) {
  return InkWell(
    onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UsingRules()));
      },
    child: Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Container(
        width: width,
        height: 113,
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 146, 2, 1),
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
              Image.asset('assets/home/home_bulb_icon.png', height: 48, width: 48,),
              Text('Қолдану бойынша\n кеңестер', 
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
