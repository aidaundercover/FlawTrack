import 'package:flawtrack/const.dart';
import 'package:flawtrack/views/maps/maps_of_corrections.dart';
import 'package:flawtrack/views/maps/maps_of_problems.dart';
import 'package:flawtrack/views/maps/maps_of_volunteers.dart';
import 'package:flawtrack/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/maps_widget.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: primaryColor,
        title: Text(
          "Карты",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, size: 27, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      drawer: DrawerCustom(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[ Container(
              width: (MediaQuery.of(context).size.width) * 0.85,
              child: Column(
                children: [
                  Image.asset('assets/maps.png'),
                  SizedBox(height: 10,),
                  buildMapsCard(context, 'assets/maps/mapscard1.png', 'Карта\nпроблем', MapsOfProblems()),
                  buildMapsCard(context, 'assets/maps/mapscard2.png', 'Карта\nисправлений', MapsOfCorrections()),
                  buildMapsCard(context, 'assets/maps/mapscard1.png', 'Карта\nволентеров', MapsOfVolunteers()),
                  SizedBox(height: 50,)
                ],
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }
}
