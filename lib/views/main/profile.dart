import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/provider_widget.dart';
import 'package:intl/intl.dart';
import 'package:flawtrack/widgets/profile_widget.dart';
import '../../const.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
            ProfuleCard(),
            Container(
              width: width*0.83,
              child: Column(
                children: [
                  Text('Базовая информация',
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),
                  ),
                  SizedBox(height: 6,),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 27, color: black,),
                      SizedBox(width: 10,),
                      Text('Павлодар, Казахстан',
                        style: TextStyle(
                        color: black,
                        fontSize: 18
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.mail_outline, size: 27, color: black,),
                      SizedBox(width: 10,),
                      Text('aida_abkenova@gmail.com',
                        style: TextStyle(
                        color: black,
                        fontSize: 18
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.self_improvement, size: 27, color: black,),
                      SizedBox(width: 10,),
                      Text('ТОО “Тазалык”',
                        style: TextStyle(
                        color: black,
                        fontSize: 18
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Text('Форумы',
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),
                  ),
                ],
              ),
            )
          ],),
        )
      )
    );
  }
}
