import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'pages.dart';
import 'package:flawtrack/views/main/home_view.dart';


class HomeVolunteer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeVolunteerState();
  }
}

class _HomeVolunteerState extends State<HomeVolunteer> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    Maps(),
    Volunteers(),
    Forum(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: white,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: black,
          unselectedItemColor: grey,
          iconSize: 32,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Басты бет",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp),
              label: "Карталар",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism),
              label: "Волонтерлар",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.speaker_notes),
              label: "Форум",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Профиль",
            ),
          ]
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}