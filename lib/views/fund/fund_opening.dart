import 'package:flawtrack/views/fund/fund_main.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class FundOpening extends StatelessWidget {
  const FundOpening({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
              onPressed: () => Navigator.of(context).pop()),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text('Сделай свой\nгород лучше!',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold
                ),
              ),
            Image.asset('assets/fund_welcome.png', width: width),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FundMain()));
              },
              child: Container(
                height: 57,
                width: 180,
                color: white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  'Помочь',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}