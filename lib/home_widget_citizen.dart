import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'pages.dart';
import 'package:flawtrack/views/main/home_view.dart';


class HomeCitizen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeCitizenState();
  }
}

class _HomeCitizenState extends State<HomeCitizen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    Maps(),
    Forum(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          backgroundColor: white,
          selectedItemColor: black,
          unselectedItemColor: grey,
          iconSize: 32,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Главная",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp),
              label: "Карты",
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