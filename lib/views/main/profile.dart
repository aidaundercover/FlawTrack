import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawtrack/views/app/chat/pushkin.dart';
import 'package:flawtrack/widgets/drawer.dart';
import 'package:flawtrack/widgets/profile/main_info_widget.dart';
import 'package:flawtrack/widgets/profile/my_calendar_widget.dart';
import 'package:flawtrack/widgets/profile/my_forums_widget.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/profile/profile_card.dart';
import '../../const.dart';




class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
 
  static FirebaseFirestore _db = FirebaseFirestore.instance;


  Future getCurrentUserData() async {
    
      DocumentSnapshot ds = await _db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      setState(() {
        nameGlobal = ds.get('name')?? 'Loading';
        volunteer = ds.get('volunteer') ??'Loading';
      });
      
  }
  
  @override
  void initState() {
    getCurrentUserData();
    super.initState();
    
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
                      
                    child: 
                    ProfuleCard(
                      name: nameGlobal,
                    ),
                  ),
                )
              ]),
              SizedBox(height: 25),
            MainInfo(),
            MyCalendar(),
            MyForums()
            ],
          ),
        ));
  }
}
