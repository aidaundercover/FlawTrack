import 'package:flawtrack/views/fund/fund_opening.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

Widget fund(BuildContext context, double width) {
  return InkWell(
    onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FundOpening()));
      },
    child: Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Container(
        width: width,
        height: 250,
        decoration: BoxDecoration(
          color: yellow,
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
              Image.asset('assets/home_trophy_icon.png', height: 132),
              SizedBox(height: 20,),
              Text('Фонд', 
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
