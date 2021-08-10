import 'package:flawtrack/views/become_volunteer/five.dart';
import 'package:flawtrack/views/become_volunteer/four.dart';
import 'package:flawtrack/views/become_volunteer/one.dart';
import 'package:flawtrack/views/become_volunteer/three.dart';
import 'package:flawtrack/views/become_volunteer/two.dart';
import 'package:flawtrack/widgets/dialogs/switch_status.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class BecomeVolunteer extends StatefulWidget {
  const BecomeVolunteer({Key? key}) : super(key: key);

  @override
  _BecomeVolunteerState createState() => _BecomeVolunteerState();
}

class _BecomeVolunteerState extends State<BecomeVolunteer> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    Widget linkpoint(String title, Widget page) {
      return Container(
        width: _width * 0.84,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => page));
              },
              child: Text(
                '- ' + title,
                style: TextStyle(
                    color: black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          'Стать волонтером',
          style: TextStyle(
              color: black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Волонтер – это\nдобровольный помощник!',
              style: TextStyle(
                  color: darkBlue, fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: _height * 0.044,
          ),
          Center(
            child: Image.asset(
              'assets/volunteer.png',
              width: _width * 0.87,
            ),
          ),
          SizedBox(
            height: _height * 0.059,
          ),
          linkpoint('Деятельность волонтера', One()),
          linkpoint('История движения', Two()),
          linkpoint('Причины становиться волонтером', Three()),
          linkpoint('Кому подходит волонтерство', Four()),
          linkpoint('Перспективы волонтерства', Five()),
          SizedBox(
            height: _height * 0.049,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  SwitchDialog();
                },
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                          )),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primaryColor,
                        primaryColor,
                        Color.fromRGBO(250, 232, 232, 1)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.topRight
                      )
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text( "Стать волонтером",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                  ),
                ),),
          )
        ],
      ),
    );
  }
}
