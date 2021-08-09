import 'package:flawtrack/widgets/home_view/become_volunteer_widget.dart';
import 'package:flawtrack/widgets/home_view/events_widget.dart';
import 'package:flawtrack/widgets/home_view/fund_widget.dart';
import 'package:flawtrack/widgets/home_view/location_view.dart';
import 'package:flawtrack/widgets/home_view/news_slider.dart';
import 'package:flawtrack/widgets/home_view/using_advices.dart';
import 'package:flawtrack/widgets/home_view/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/widgets/drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width*0.88;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(255, 152, 0, 1),
                Color.fromRGBO(255, 206, 49, 1),
                Color.fromRGBO(255, 248, 226, 1)
              ]),
        )),
        title: Text("FlawTrack",
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, size: 27, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search, size: 27, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      drawer: DrawerCustom(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              locationView(width/0.88),
              NewsTile(),
              Text('Главная',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              eventsWidget(context, width),
              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:[
                        usingAdvice(context, width*0.4768),
                        becomeVolunteer(context, width*0.4768)
                      ]
                    ),
                    fund(context, width*0.4768)
                  ],
                ),
              ),
              weather(width),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
