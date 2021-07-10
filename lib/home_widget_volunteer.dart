import 'package:flutter/material.dart';
import 'pages.dart';
import 'package:flawtrack/views/home_view.dart';


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
          onTap: onTabTapped,
          currentIndex: _currentIndex,
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
              icon: Icon(Icons.volunteer_activism),
              label: "Волонтеры",
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