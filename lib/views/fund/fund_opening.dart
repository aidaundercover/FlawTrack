import 'package:flawtrack/views/fund/fund_main.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class FundOpening extends StatelessWidget {
  const FundOpening({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;

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
            Image.asset('assets/fund_welcome.png', height: width*0.65,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FundMain()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(white),
                fixedSize:MaterialStateProperty.all<Size>(
                  Size(180,57),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                )
                )
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Помочь',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: black
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