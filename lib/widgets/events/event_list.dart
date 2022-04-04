import 'package:flawtrack/const.dart';
import 'package:flawtrack/widgets/events/city_events.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(events.length, (index){
        return eventTile(context, events[index].title, events[index].imgUrl, events[index].description, events[index].bc, MediaQuery.of(context).size.width);
    }
    ));
  }
}
