import 'package:flawtrack/const.dart';
import 'package:flawtrack/views/app/chat/pushkin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyForums extends StatefulWidget {
  const MyForums({Key? key}) : super(key: key);

  @override
  State<MyForums> createState() => _MyForumsState();
}

class _MyForumsState extends State<MyForums> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
          Text(
            AppLocalizations.of(context).forums,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: black, fontWeight: FontWeight.w600, fontSize: 22),
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
                                image: AssetImage('assets/forum_images/f1.png'))),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Улица Александра Пушкина',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
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
                              image: AssetImage('assets/forum_images/f2.png'))),
                    ),
                    SizedBox(height: 10),
                    Text('ЖК Кенесары',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
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
                              image: AssetImage('assets/forum_images/f3.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 10),
                    Text('Майры 39',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
