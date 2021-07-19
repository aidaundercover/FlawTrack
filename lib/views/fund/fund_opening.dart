import 'package:flawtrack/views/fund/fund_main.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class FundOpening extends StatelessWidget {
  const FundOpening({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: yellow,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text('Сделай свой\nгород лучше!',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold
              ),
            ),
          Image.asset('assets/fund_welcome.png', height: height*0.75),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FundMain()));
            },
            child: Text(
              'Помочь',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ]
      ),
    );
  }
}