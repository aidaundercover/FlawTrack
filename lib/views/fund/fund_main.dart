import 'package:firebase_storage/firebase_storage.dart';
import 'package:flawtrack/widgets/fund_program_tile.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../../const.dart';

class FundMain extends StatefulWidget {
  const FundMain({Key? key}) : super(key: key);

  @override
  _FundMainState createState() => _FundMainState();
}

class _FundMainState extends State<FundMain> {

   


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

      List<_DonationData> data = [
    _DonationData('Животные', 0),
    _DonationData('Облагорожение', 0),
    _DonationData('Бездомные', 0),
    _DonationData('Другое', 0),
  ];


    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text('Инвестиции фонда', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: black)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
              onPressed: () => Navigator.of(context).pop()),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.25),
                      offset: Offset(0,4),
                    )
                  ]
                ),
                width: width*0.845,
                height: 425,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SfCircularChart(
              series: <CircularSeries<_DonationData, String>>[
                PieSeries<_DonationData, String>(
                    dataSource: data,
                    xValueMapper: (_DonationData sales, _) => sales.type,
                    yValueMapper: (_DonationData sales, _) => sales.money,
                  )
              ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    color: Color.fromRGBO(255, 86, 86, 1.0),
                                    child: Image.asset('assets/fund/animals.png', width: 22,)),
                                ),
                                Text('Животные', style: TextStyle(fontSize: 15))
                            ],),
                          ),
                          Container(
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    color: Color.fromRGBO(208, 255, 231, 1.0),
                                    child: Image.asset('assets/fund/ennoblement.png', width: 22,)),
                                ),
                                Text('Облагораживание', style: TextStyle(fontSize: 15))
                            ],),
                          )
                      ],),
                    SizedBox(height: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            ClipOval(
                              child: Container(
                                height: 35,
                                width: 35,
                                color: Color.fromRGBO(250, 231, 156, 1.0),
                                child: Image.asset('assets/fund/homeless.png', width: 22,)),
                            ),
                            Text('Бездомные', style: TextStyle(fontSize: 15))
                        ],),
                      ),
                      Container(
                        child: Row(
                          children: [
                            ClipOval(
                              child: Container(
                                height: 35,
                                width: 35,
                                color: Color.fromRGBO(0, 174, 224, 1.0),
                                child: Image.asset('assets/fund/others.png', width: 22,)),
                            ),
                            Text('Другое', style: TextStyle(fontSize: 15))
                        ],),
                      )
                  ],)
                    ],
                  ),
                  
                ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
              alignment: Alignment.center,
              width: width*0.85,
              child: Column(
              children: [
              Text('Последние пожертвования', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Container(
                height: 110,
                alignment: Alignment.center,
                child: Text('Еще не было совершено никаких пожертвовоаний или сборов', style: TextStyle(fontSize: 11.5, color: grey)),
              ),
              SizedBox(
              height: 30,
              ),
              FundTile('Программа по облгораживанию района Сарырка', 248, 'assets/fund/p1.png', 65)
              ],
              ),
              )
            ]
          ),
        ),
      ),
    );
  }
}

class _DonationData {
  _DonationData(this.type, this.money);

  final String type;
  final double money;
}
