import 'package:flutter/material.dart';

import '../const.dart';


class ProfuleCard extends StatefulWidget {
  const ProfuleCard({ Key? key }) : super(key: key);

  @override
  _ProfuleCardState createState() => _ProfuleCardState();
}

class _ProfuleCardState extends State<ProfuleCard> {

  @override

  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width*0.85,
      height: 216,
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.23),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 6), // changes position of shadow
          ),
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: width*0.289,
                width: width*0.289,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(196, 196, 196, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                child: Icon(Icons.person, size: width*0.193, color: Color.fromRGBO(255, 235, 164, 1))
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Text(
                    'Аягуль Арамова',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'волонтер',
                    style: TextStyle(
                      color: Color.fromRGBO(154, 154, 154, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 15
                    )
                  ),
                ],
              ),
              Container(
                width: width*0.43,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(231, 231, 231, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Пинов',
                          style: TextStyle(
                            color: Color.fromRGBO(154, 154, 154, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 10
                          ),
                        ),
                        Text(
                          '16',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Пинов',
                          style: TextStyle(
                            color: Color.fromRGBO(154, 154, 154, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 10
                          ),
                        ),
                        Text(
                          '16',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Пинов',
                          style: TextStyle(
                            color: Color.fromRGBO(154, 154, 154, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 10
                          ),
                        ),
                        Text(
                          '16',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
                ],
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                      )
                    )
                ),
                child: Container(
                  width: width*0.34,
                  height: 36,
                  child: Text(
                    'Связаться',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      )
                    )
                ),
                child: Container(
                  width: width*0.34,
                  height: 36,
                  child: Text(
                    'Похвалить',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
