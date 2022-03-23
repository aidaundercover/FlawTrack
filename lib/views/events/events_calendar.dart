import 'package:flawtrack/widgets/events/aitmatova.dart';
import 'package:flawtrack/widgets/events/city_events.dart';
import 'package:flutter/material.dart';
import '../../const.dart';
import 'package:flawtrack/widgets/events/day_calendar.dart';

class EventsCalendar extends StatefulWidget {
  const EventsCalendar({Key? key}) : super(key: key);

  @override
  _EventsCalendarState createState() => _EventsCalendarState();
}

class _EventsCalendarState extends State<EventsCalendar> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
      List<bool> isSelected = [false, false, false, false, false, false];
    
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: primaryColor,
        title: Text(
          "Іс-шаралар күнтізбесі",
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
                  HorizontalLizt(),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 15),
                    child: Text('Бүгінге жоспарланған:', style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold, fontSize: 23)),
                  ),
                  GestureDetector(
                    onTap:() {
                    aitmatova(context, _width);
                    },
                    child: eventTile(context, 'Субботник на Айтаматова', 'assets/events/broom.png', 'у памятника Абая в 17:00', Color.fromRGBO(255, 162, 141, 1.0), _width)),
                  eventTile(context, 'Велосипедный марафон', 'assets/events/bike.png', 'Парк Гагарина,у ворот в 9:00', Color.fromRGBO(113, 204, 255, 1.0), _width),
                  eventTile(context, 'Вебинар по переработке мусора', 'assets/events/woman.png', 'в Zoom в 21:00', Color.fromRGBO(185, 141, 255, 1.0), _width)
                  
                ],
              ),
            ),
          
    
      ])),
    );
  }

}


