import 'dart:convert';
import 'package:flawtrack/models/Event.dart';
import 'package:flutter/material.dart';
import '../../const.dart';

class EventsCalendar extends StatefulWidget {
  const EventsCalendar({Key? key}) : super(key: key);

  @override
  _EventsCalendarState createState() => _EventsCalendarState();
}

class _EventsCalendarState extends State<EventsCalendar> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: primaryColor,
        title: Text(
          "Календарь событий",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.chevron_left_outlined, size: 35, color: black),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: SingleChildScrollView(
          child: 
          Column(children: [
          Image.asset('assets/home/events.png', width:_width),
          Container(
              width: _width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: lightYellow,
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  horizontalList(),
                  SizedBox(height: 30,),
                  Container(
                    width: _width*0.89,
                    alignment: Alignment.centerRight,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                        ),
                        SizedBox(width: 6,),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: grey.withOpacity(0.8)),
                        )
                      ],),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Container(
                      width: _width*0.86,
                      child: Column(children: [
                        Text('Мероприятия на сегодня', style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold, fontSize: 23)),
                        SizedBox(height: 30,),
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 162, 141, 1.0),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 244, 244, 0.19),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Image.asset('assets/events/broom.png', width: 31,)
        ),
      Container(
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[ 
            Text('Субботник на Айтаматова', style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text('у памятника Абая в 17:00', style: TextStyle(color: white, fontSize: 12))
          ]
        ),
      )
    ],),
  )
                      ],),
                  )
                ],
              ),
            ),
          
    
      ])),
    );
  }

}


Widget horizontalList() {

    var styleDay =
        TextStyle(color: Color.fromRGBO(161, 161, 161, 1.0), fontSize: 18);
    var styleDate =
        TextStyle(color: darkBlue, fontSize: 23, fontWeight: FontWeight.bold);

    String dateFormatter(DateTime date) {
      dynamic dayData =
          '{ "1" : "ПН", "2" : "ВТ", "3" : "СР", "4" : "ЧТ", "5" : "ПТ", "6" : "СБ", "7" : "ВС" }';

      return json.decode(dayData)['${date.weekday}'];
    }

    String getTheDay(DateTime date) {
      return date.day.toString();
    }

    return Container(
      height: 78,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 23,
          ),
          Container(
            width: 55,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(DateTime.now().subtract(Duration(days: 2)))
                        .toString(),
                    style: styleDay),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now().subtract(Duration(days: 2))),
                  style: styleDate,
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(DateTime.now().subtract(Duration(days: 1)))
                        .toString(),
                    style: styleDay),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now().subtract(Duration(days: 1))),
                  style: styleDate,
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
                          color: primaryColor,

                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(DateTime.now())
                        .toString(),
                    style: TextStyle(
                      color: white,
                      fontSize: 18
                    )),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now()),
                  style: TextStyle(
                      color: white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(DateTime.now().add(Duration(days: 1)))
                        .toString(),
                    style: styleDay),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now().add(Duration(days: 1))),
                  style: styleDate,
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(DateTime.now().add(Duration(days: 2)))
                        .toString(),
                    style: styleDay),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now().add(Duration(days: 2))),
                  style: styleDate,
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(DateTime.now().add(Duration(days: 3)))
                        .toString(),
                    style: styleDay),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now().add(Duration(days: 3))),
                  style: styleDate,
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(DateTime.now().add(Duration(days: 4)))
                        .toString(),
                    style: styleDay),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now().add(Duration(days: 4))),
                  style: styleDate,
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromRGBO(161, 161, 161, 1.0), width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    dateFormatter(DateTime.now().add(Duration(days: 5)))
                        .toString(),
                    style: styleDay),
                SizedBox(
                  height: 11,
                ),
                Text(
                  getTheDay(DateTime.now().add(Duration(days: 5))),
                  style: styleDate,
                )
              ],
            ),
          ),
          SizedBox(
            width: 23,
          ),
        ],
      ),
    );
  }