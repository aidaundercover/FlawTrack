import 'package:flawtrack/widgets/events/even_tile.dart';
import 'package:flutter/material.dart';


  Widget eventList(BuildContext context, List events) {
    return ListView(
      children: List.generate(events.length, (index){
        return eventTile(context, events[index]["title"], events[index]["imgUrl"], events[index]["description"], MediaQuery.of(context).size.width, events[index]["color"]);
  }
      ));
  }
