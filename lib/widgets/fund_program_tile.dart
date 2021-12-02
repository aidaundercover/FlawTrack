import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../const.dart';

Widget FundTile(String name, int neededMoney, String img, int percent) {
  return Column(
    children: [
      Container(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              '$img',
              height: 74,
              width: 93,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 14,
            ),
            Container(
              width: 180,
              child: Text(
                '$name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7),
              child: Column(
                children: [
                  Text('${percent.toString()}' + '%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  SizedBox(height: 5,),
                  Text('₸' +'${neededMoney.toString()}' + 'K',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: grey
                      )),
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 20,
      )
    ],
  );
}
