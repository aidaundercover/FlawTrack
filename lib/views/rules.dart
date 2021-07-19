import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/routes.dart';

class UsingRules extends StatelessWidget {
  const UsingRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          'Правила использования',
          style: TextStyle(
              color: black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.homeCitizen);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Разметка карты: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:20,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Table(
                border: TableBorder.all(  
                  color: Color.fromRGBO(227, 227, 227, 1),  
                  style: BorderStyle.solid,  
                  width: 1), 
                  children: [  
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/trashcan.png'), size: 24, color: black)]),  
                        Column(children:[Text('Мусор в неположенном месте', style: TextStyle(fontSize: 15.0))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/road.png'), size: 24, color: black)]),  
                        Column(children:[Text('Дорога/тратуар разбита', style: TextStyle(fontSize: 15.0))]),  
                      ]),
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/dog.png'), size: 24, color: black)]),  
                        Column(children:[Text('Бездомная/потерявшаяся собака', style: TextStyle(fontSize: 15.0))]),  
                      ]),
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/cat.png'), size: 24, color: black)]),  
                        Column(children:[Text('Бездомный/потерявшийся кот', style: TextStyle(fontSize: 15.0))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/garbagecan.png'), size: 24, color: black)]),  
                        Column(children:[Text('Свалка в неположенном месте', style: TextStyle(fontSize: 15.0))]),  
                      ]),
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/drops.png'), size: 24, color: black)]),  
                        Column(children:[Text('Затопление', style: TextStyle(fontSize: 15.0))]),  
                      ]),
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/bomzh.png'), size: 24, color: black)]),  
                        Column(children:[Text('БОМЖ', style: TextStyle(fontSize: 15.0))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/volunteer.png'), size: 24, color: black)]),  
                        Column(children:[Text('Волонтер', style: TextStyle(fontSize: 15.0))]),  
                      ]),
                      TableRow( children: [  
                        Column(children:[ImageIcon(AssetImage('assets/star.png'), size: 24, color: black)]),  
                        Column(children:[Text('Исправлено', style: TextStyle(fontSize: 15.0))]),  
                      ]),
                    ],  
              ),
              SizedBox(height: 20,),
              Center(
                child: Text(
                    'Онлайн-этикет',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:20,
                    ),
                  ),
              ),
              Image.asset('assets/etiquet.png', width: width*0.85,),
              
            ],
          ),
        ),
      ),
    );
  }
}
