import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/provider_widget.dart';
import 'package:intl/intl.dart';
import 'package:flawtrack/models/User.dart';

import '../../const.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            
          ],),
        )
      )
    );
  }
}
