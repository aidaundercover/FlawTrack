import 'package:flawtrack/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class ForumView extends StatefulWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  _ForumViewState createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool chatsPressed = true;
    bool searchPressed = false;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: yellow,
        title: Text(
          "Форум",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, size: 27, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      drawer: DrawerCustom(),
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    chatsPressed = !chatsPressed;
                  });
                },
                child: Container(
                  width: width / 2,
                  height: 55,
                  decoration: BoxDecoration(
                      // ignore: dead_code
                      border: chatsPressed
                          ? Border(
                              bottom: BorderSide(width: 6, color: primaryColor))
                          : Border.fromBorderSide(BorderSide.none)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'ЧАТЫ',
                        style: TextStyle(
                            // ignore: dead_code
                            color: chatsPressed ? black : grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    searchPressed = !searchPressed;
                  });
                },
                child: Container(
                  width: width / 2,
                  height: 55,
                  decoration: BoxDecoration(
                      // ignore: dead_code
                      border: searchPressed
                          ? Border(
                              bottom: BorderSide(width: 6, color: primaryColor))
                          : Border.fromBorderSide(BorderSide.none)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'ИСКАТЬ',
                        style: TextStyle(
                            // ignore: dead_code
                            color: searchPressed ? black : grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: searchPressed ? Container() : Container(),
          )
        ],
      ),
    );
  }
}
