import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class Event {
  String title;
  DateTime startDate;
  late DateTime endDate;
  String address;
  String description;
  String organization;
  String imgUrl;
  late String eventType;

  late DocumentReference reference;



  Event.fromMap(
      Map<String, dynamic> map,
      this.title,
      this.startDate,
      this.address,
      this.description,
      this.organization,
      this.imgUrl,
    );

  @override
  String toString() => 'Event<$title:$description>';

  int getDaysUntilEvent() {
    int diff = startDate.difference(DateTime.now()).inDays;
    if (diff < 0) {
      diff = 0;
    }
    return diff;
  }
}

Widget buildCard(Color bc, String title, String address, String imgUrl) {
  return Container(
    height: 90,
    decoration: BoxDecoration(
      color: bc,
      borderRadius: BorderRadius.circular(7),
    ),
    child: Row(children: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 244, 244, 0.19),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Image.network(imgUrl, width: 31,)),
      Container(
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[ 
            Text(title, style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
            Text(address, style: TextStyle(color: white, fontSize: 12))
          ]
        ),
      )
    ],),
  );
}
