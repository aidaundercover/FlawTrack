import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

Widget buildMapsCard(BuildContext context, String img, String text, Widget fun) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
    child: InkWell(
      onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => fun));
      },
      child: Container(
        height: 123,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(244, 146, 2, 1),
                  Color.fromRGBO(250, 231, 156, 1),
                ]),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(3, 5), // changes position of shadow
        ),
      ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23
                  ),
                ),
              )
            ),
            Expanded(
                flex: 4,
                child: Image.asset(img)
                )
        ],),
      ),
    ),
  );
}
