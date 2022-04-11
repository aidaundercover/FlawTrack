import 'package:flutter/material.dart';


Widget eventTile(BuildContext context, String title, String img, String desc,
    double width, Color color) {
  return Container(
    child: Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 90,
            width: width * 0.86,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(7)),
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
                        borderRadius: BorderRadius.circular(16)),
                    child: Image.network(
                      img,
                      width: 52,
                      height: 52,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20),
                        Text('$title',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('$desc',
                            style: TextStyle(color: Colors.white, fontSize: 12))
                      ]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25)
      ],
    ),
  );
}
