import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightYellow,
        body: Column(
      children: [
        Container(
          width: width*0.8,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/welcome/error.png'))),
        ),
        SizedBox(height: 20),
        Container(
          width: width*0.8,
          child: Text(
            'Something went wrong',
            style: TextStyle(
              color: primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ));
  }
}
