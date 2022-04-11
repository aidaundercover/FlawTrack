import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flawtrack/widgets/events/aitmatova.dart';
import 'package:flawtrack/widgets/events/even_tile.dart';
import 'package:flawtrack/widgets/events/event_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/events/day_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class EventsCalendar extends StatefulWidget {
  const EventsCalendar({Key? key}) : super(key: key);

  @override
  State<EventsCalendar> createState() => _EventsCalendarState();
}

class _EventsCalendarState extends State<EventsCalendar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('$refEventCity');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context).events,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              boxShadow: [BoxShadow(offset: Offset(4,5), color: black.withOpacity(0.5))]
            ),
            width: 60,
            height: 60,
            child: Center(
              child: IconButton(
                  icon: Icon(Icons.chevron_left_outlined, size: 35, color: black),
                  onPressed: () => Navigator.pop(context)),
            ),
          ),
        ),
      ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('events/$refEventCity')
      //       .snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     return 
      body:  Column(
            children: [
              HorizontalLizt(),
              ],
          )
        
    );
  }
}
