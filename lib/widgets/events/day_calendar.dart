import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flawtrack/widgets/events/even_tile.dart';
import 'package:flawtrack/widgets/events/event_list.dart';
import 'package:flutter/material.dart';

List<Map> isSelected = [
  {"selected": false, "add": -2},
  {"selected": false, "add": -1},
  {"selected": true, "add": 0},
  {"selected": false, "add": 1},
  {"selected": false, "add": 2},
  {"selected": false, "add": 3},
  {"selected": false, "add": 4},
  {"selected": false, "add": 5},
];

int info = 3;

// var db = FirebaseFirestore.instance.collection('events/$refEventCity');

bool selected = false;

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "ДС", "2" : "СС", "3" : "СР", "4" : "БС", "5" : "ЖМ", "6" : "СБ", "7" : "ЖС" }';

  return json.decode(dayData)['${date.weekday}'];
}

String getTheDay(DateTime date) {
  return date.day.toString();
}

// Future retrieveEvents(DateTime date) async {
//   await db.get().then((QuerySnapshot querySnapshot) {
//     querySnapshot.docs.forEach((doc) async {
//       doc['${date.year}-${date.month}'].forEach((doc) {
//         events.add(doc as Event);
//       });
//     });
//   });
// }
convertToIndex(int n) {
  switch (n) {
    case -2:
      return 0;
    case -1:
      return 1;
    case 0:
      return 2;
    case 1:
      return 3;
    case 2:
      return 4;
    case 3:
      return 5;
    case 4:
      return 6;
    case 5:
      return 7;
  }
}

class HorizontalLizt extends StatefulWidget {
  const HorizontalLizt({Key? key}) : super(key: key);

  @override
  State<HorizontalLizt> createState() => _HorizontalLiztState();
}

class _HorizontalLiztState extends State<HorizontalLizt> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // eventList(context, events[info]);
  }

  int globalHeight = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(isSelected.length, (index) {
                var styleDay;
                var styleDate;
                return InkWell(
                    onTap: () {
                      setState(() {
                        for (int indexBtn = 0;
                            indexBtn < isSelected.length;
                            indexBtn++) {
                          if (indexBtn == index) {
                            selected = isSelected[indexBtn]["selected"] = true;
                            globalHeight =
                                convertToIndex(isSelected[indexBtn]["add"]);
                          } else {
                            isSelected[indexBtn]["selected"] = false;
                          }
                        }
                      });
                    },
                    child: Column(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: 55,
                            height: 75,
                            decoration: BoxDecoration(
                                color: isSelected[index]["selected"]
                                    ? primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color.fromRGBO(161, 161, 161, 1.0),
                                    width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    dateFormatter(DateTime.now().add(Duration(
                                        days: isSelected[index]["add"]))),
                                    style: styleDay),
                                SizedBox(
                                  height: 11,
                                ),
                                Text(
                                  getTheDay(DateTime.now().add(Duration(
                                      days: isSelected[index]["add"]))),
                                  style: styleDate,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]));
              })),
        ),
        Container(
            height: 200,
            child: ListView.builder(itemBuilder: (context, i) => eventTile(context, events[globalHeight][i]["title"], events[globalHeight][i]["imgUrl"],  events[globalHeight][i]["description"], MediaQuery.of(context).size.width,  events[globalHeight][i]["color"])))
      ],
    );
  }
}
