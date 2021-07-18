import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromRGBO(255, 152, 0, 1),
              Color.fromRGBO(255, 206, 49, 1),
              Color.fromRGBO(255, 248, 226, 1)
            ]),
      )),
      title: Text("FlawTrack", 
        style: TextStyle(
          fontSize: 25.0, 
          color: Colors.black, 
          fontWeight: FontWeight.bold)),
      centerTitle: true,
      leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded, 
                size: 27, color: Colors.black),
                onPressed: () => Scaffold.of(context).openDrawer()),
          ),
      actions: [
            IconButton(
                icon: Icon(Icons.search, size: 27, color: Colors.black),
                onPressed: () {}),
          ],
      ),
      drawer: DrawerCustom(),
    );
  }
}
