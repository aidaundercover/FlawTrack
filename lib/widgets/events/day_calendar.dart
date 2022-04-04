import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

import '../../models/Event.dart';

class DayBlock extends StatefulWidget {
  DayBlock({
    Key? key,
    required this.add,
  }) : super(key: key);
  final int add;

  @override
  State<DayBlock> createState() => _DayBlockState();
}

List<Map> isSelected = [
  {"selected": false, "add": -1},
  {"selected": false, "add": -2},
  {"selected": false, "add": 0},
  {"selected": true, "add": 1},
  {"selected": false, "add": 2},
  {"selected": false, "add": 3},
  {"selected": false, "add": 4},
  {"selected": false, "add": 5},
];

var db = FirebaseFirestore.instance.collection('events');

bool selected = false;

Future retrieveEvents(DateTime date) async {
  await db.get().then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) async {
      doc['${date.year}/${date.month}/${date.day}'].forEach((doc) {
        events.add(doc as Event);
      });
    });
  });
}

class _DayBlockState extends State<DayBlock> {
  void select() {
    setState(() {
      selected = true;
    });
  }

  void changeCity() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    select();
    changeCity();
  }

  @override
  Widget build(BuildContext context) {
    selected = widget.add == 0 ? true : false;

    var styleDay = selected
        ? TextStyle(color: white, fontSize: 18)
        : TextStyle(color: Color.fromRGBO(161, 161, 161, 1.0), fontSize: 18);
    var styleDate = selected
        ? TextStyle(color: white, fontSize: 23, fontWeight: FontWeight.bold)
        : TextStyle(color: darkBlue, fontSize: 23, fontWeight: FontWeight.bold);

    String dateFormatter(DateTime date) {
      dynamic dayData =
          '{ "1" : "ДС", "2" : "СС", "3" : "СР", "4" : "БС", "5" : "ЖМ", "6" : "СБ", "7" : "ЖС" }';

      return json.decode(dayData)['${date.weekday}'];
    }

    String getTheDay(DateTime date) {
      return date.day.toString();
    }

    return Row(
      children: [
        SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            retrieveEvents(DateTime.now().add(Duration(days: widget.add)));
            select();
          },
          child: Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
                color: widget.add == 0 || selected == true
                    ? primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(
                        DateTime.now().add(Duration(days: widget.add))),
                    style: styleDay),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now().add(Duration(days: widget.add))),
                  style: styleDate,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalLizt extends StatefulWidget {
  const HorizontalLizt({Key? key}) : super(key: key);

  @override
  State<HorizontalLizt> createState() => _HorizontalLiztState();
}

class _HorizontalLiztState extends State<HorizontalLizt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      child: ListView(
          children: List.generate(isSelected.length, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              for (int indexBtn = 0; indexBtn < isSelected.length; indexBtn++) {
                if (indexBtn == index) {
                  selected = isSelected[indexBtn]["selected"] =
                      !isSelected[indexBtn]["selected"];
                  isSelected[2]["selected"] = false;
                } else {
                  isSelected[indexBtn]["selected"] = false;
                }
              }
            });
          },
          child: DayBlock(add: isSelected[index]["add"]),
        );
      })),
    );
  }
}
