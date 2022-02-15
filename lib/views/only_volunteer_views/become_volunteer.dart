import 'package:flawtrack/home_widget_volunteer.dart';
import 'package:flawtrack/views/only_volunteer_views/become_volunteer/five.dart';
import 'package:flawtrack/views/only_volunteer_views/become_volunteer/four.dart';
import 'package:flawtrack/views/only_volunteer_views/become_volunteer/three.dart';
import 'package:flawtrack/views/only_volunteer_views/become_volunteer/two.dart';
import 'package:flawtrack/views/only_volunteer_views/become_volunteer/one.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class BecomeVolunteer extends StatefulWidget {
  const BecomeVolunteer({Key? key}) : super(key: key);

  @override
  _BecomeVolunteerState createState() => _BecomeVolunteerState();
}

class _BecomeVolunteerState extends State<BecomeVolunteer> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text('Волонтер – это\nдобровольный помощник!',
                  style: TextStyle(
                      color: darkBlue,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: _height * 0.044,
            ),
            Center(
              child: Container(
                child: Image.asset(
                  'assets/become_v.png',
                  height: _height * 0.22,
                ),
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
              child: TextButton(
                onPressed: () {
                  switchStatus();
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 45,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    primaryColor,
                    primaryColor,
                    Color.fromRGBO(250, 232, 232, 1),
                    primaryColor,
                  ], begin: Alignment.centerLeft, end: Alignment.topRight)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Стать волонтером",
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void switchStatus() {
    cancelButton(BuildContext context) {
      return TextButton(
        child: Container(
          width: 72,
          height: 24,
          color: Color.fromRGBO(246, 242, 242, 1),
          alignment: Alignment.center,
          child: Text(
            'Отмена',
            style: TextStyle(
              fontSize: 13,
              color: grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
    }

    okButton(BuildContext context) {
      return TextButton(
        child: Container(
          width: 72,
          height: 24,
          color: primaryColor.withOpacity(0.6),
          alignment: Alignment.center,
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: 13,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onPressed: () {
          volunteer = true;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeVolunteer()));
        },
      );
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 340,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FlawTrack ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Text(
                      'хочет поменять',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                    ),
                  ],
                ),
                Text(
                  'статус вашего аккаунта',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.74,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Email/Номер телефона',
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey, width: 1))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.74,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Пароль',
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey, width: 1))),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.76,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          cancelButton(context),
                          SizedBox(
                            width: 18,
                          ),
                          okButton(context)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
        });
  }
}
