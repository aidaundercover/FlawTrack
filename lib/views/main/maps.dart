import 'package:flawtrack/const.dart';
import 'package:flawtrack/views/maps/maps_of_corrections.dart';
import 'package:flawtrack/views/maps/maps_of_problems.dart';
import 'package:flawtrack/views/maps/maps_of_volunteers.dart';
import 'package:flawtrack/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/maps/maps_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
          AppLocalizations.of(context).maps,
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
                  SizedBox(height: 13,),
                  Image.asset('assets/maps/maps.png'),
                  SizedBox(height: 10,),
                  buildMapsCard(context, 'assets/maps/mapscard1.png', AppLocalizations.of(context).mapsp, MapsOfProblems()),
                  buildMapsCard(context, 'assets/maps/mapscard2.png', AppLocalizations.of(context).mapsc, MapsOfCorrections()),
                  Visibility(
                    visible: volunteer,
                    child: buildMapsCard(context, 'assets/maps/mapscard1.png',  AppLocalizations.of(context).mapsv, MapsOfVolunteers())),
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
