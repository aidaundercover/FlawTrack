import 'dart:convert';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable

bool selected=false; 

class DayBlock extends StatefulWidget {

  DayBlock({
    Key? key,
    required this.add,
  }) : super(key: key);
  int add;
  

  @override
  State<DayBlock> createState() => _DayBlockState();
}

class _DayBlockState extends State<DayBlock> {
  void select() {
    setState(() {
      selected = true;     
    });
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
                            DateTime.now().add(Duration(days: widget.add)))
                        .toString(),
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
  const HorizontalLizt({ Key? key }) : super(key: key);

  @override
  State<HorizontalLizt> createState() => _HorizontalLiztState();
}

class _HorizontalLiztState extends State<HorizontalLizt> {
  @override
  Widget build(BuildContext context) {
    return  Container(
    height: 78,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(
          width: 7,
        ),
        DayBlock(
          add: -2,
        ),
        DayBlock(add: -1),
        DayBlock(add: 0),
        DayBlock(add: 1),
        DayBlock(add: 2),
        DayBlock(add: 3),
        DayBlock(add: 4),
        DayBlock(add: 5),
        SizedBox(
          width: 7,
        ),
      ],
    ),
  );
  }
}


