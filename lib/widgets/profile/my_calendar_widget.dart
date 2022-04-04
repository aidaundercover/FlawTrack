import 'package:flawtrack/const.dart';
import 'package:flawtrack/views/profile/mycalendar.dart';
import 'package:flutter/material.dart';

class MyCalendar extends StatelessWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyCalendarPage()));
        },
        child: Container(
          height: 150,
          width: width * 0.86,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(offset: Offset(-5,-6),
                color: Colors.white24,
                blurRadius: 4
                ),
                BoxShadow(offset: Offset(5,6),
                color: black.withOpacity(0.3),
                blurRadius: 4
                )],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [white, Color.fromRGBO(253, 255, 255, 1)])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "My calendar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  )),
              Flexible(
              flex: 3, 
              child: Image.asset(
                'assets/home/calendar.png',
                width: width *0.4,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
