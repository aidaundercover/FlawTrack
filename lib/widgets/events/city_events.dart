import 'package:flutter/material.dart';

Widget eventTile(BuildContext context,
    String title, String img, String desc, Color bc, double width) {

  return Container(
    height: 90,
    width: width*0.86,
    decoration: BoxDecoration(
      color: bc,
      borderRadius: BorderRadius.circular(7)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 244, 244, 0.19),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Image.asset(img),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
            SizedBox(height: 20),
            Text('$title',
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text('$desc',
                style: TextStyle(color: Colors.white, fontSize: 12))
          ]),
        ),
      ],
    ),
  );
}
