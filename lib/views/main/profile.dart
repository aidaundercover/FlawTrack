import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawtrack/services/auth_service.dart';
import 'package:flawtrack/splash.dart';
import 'package:flawtrack/views/chat/pushkin.dart';
import 'package:flawtrack/views/error/smth_went_wrong.dart';
import 'package:flawtrack/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/profile_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../../const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    getCurrentUserData();
    super.initState();
    
  }

  static FirebaseFirestore _db = FirebaseFirestore.instance;


  Future getCurrentUserData() async {
    try {
      DocumentSnapshot ds = await _db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      setState(() {
        nameGlobal = ds.get('name')?? 'Loading';
        volunteer = ds.get('volunteer') ??'Loading';
      });
      } catch (e) {
      print(e.toString());
      return SomethingWentWrong();
    }
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
                    child: ProfuleCard(
                      name: nameGlobal,
                    ),
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
                          '${FirebaseAuth.instance.currentUser!.email.toString()}',
                          style: TextStyle(color: black, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    volunteer
                        ? Row(
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
                          )
                        : Row(),
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
                                  MaterialPageRoute(
                                      builder: (context) => Pushkin()));
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
