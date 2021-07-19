import 'package:flawtrack/views/become_volunteer.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

Widget becomeVolunteer(BuildContext context, double width) {
  return InkWell(
    onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BecomeVolunteer()));
      },
    child: Padding(
      padding: const EdgeInsets.only(top: 23),
      child: Container(
        width: width,
        height: 113,
        decoration: BoxDecoration(
          color: Color.fromRGBO(166, 168, 183, 1),
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
              Image.asset('assets/home_hands_icon.png', height: 64, width: 64,),
              Text('Стать волонтером', 
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
