import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawtrack/models/FlawtrackUser.dart';
import 'package:flawtrack/views/chat/pushkin.dart';
import 'package:flawtrack/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/profile_widget.dart';
import '../../const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User? user = FirebaseAuth.instance.currentUser;
  FlawtrackUser log = FlawtrackUser();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) => {this.log = FlawtrackUser.fromMap(value.data())});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
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
          leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded, size: 27, color: Colors.black),
                onPressed: () => Scaffold.of(context).openDrawer()),
          ),
        ),
        drawer: DrawerCustom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                    height: 120,
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
                Center(
                  child: Container(
                    width: width * 0.85,
                    height: 216,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.23),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ]),
                    child: ProfuleCard(),
                  ),
                )
              ]),
              SizedBox(height: 25),
              Container(
                width: width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).mainpage,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 27,
                          color: black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${addressGlobal.toString()}',
                          style: TextStyle(color: black, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 27,
                          color: black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${log.email}',
                          style: TextStyle(color: black, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.self_improvement,
                          size: 27,
                          color: black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Имя организации',
                          style: TextStyle(color: black, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Форумы',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => Pushkin()));
                            },
                            child: Container(
                              width: 162,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/forum_images/f1.png'))),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Улица Александра Пушкина',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            width: 162,
                            height: 85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/forum_images/f2.png'))),
                          ),
                          SizedBox(height: 10),
                          Text('ЖК Кенесары',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            width: 162,
                            height: 85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/forum_images/f3.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(height: 10),
                          Text('Майры 39',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
