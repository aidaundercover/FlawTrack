import 'package:flutter/material.dart';

Widget locationView() {
  return Container(
    height: 65,
    child: Row(
      children: [
        Icon(Icons.location_on, 
        size: 25, color: Colors.red),
        SizedBox(width: 3,),
        Text('', 
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 16
        ),)
    ],),
  );
}
