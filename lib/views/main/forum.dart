import 'package:flawtrack/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class ForumView extends StatefulWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  _ForumViewState createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'ЧАТЫ'),
    Tab(text: 'ИСКАТЬ'),
  ];



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        // The Builder widget is used to have a different BuildContext to access
        // closest DefaultTabController.
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 110,
              backgroundColor: yellow,
              title: Text(
                "Форум",
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: black),
              ),
              centerTitle: true,
              leading: Builder(
                builder: (context) => IconButton(
                    icon:
                        Icon(Icons.menu_rounded, size: 27, color: Colors.black),
                    onPressed: () => Scaffold.of(context).openDrawer()),
              ),
              bottom: TabBar(
                tabs: tabs,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                labelColor: black,
                unselectedLabelColor: grey,
                indicatorColor: primaryColor,
                indicatorWeight: 5,
              )),
          drawer: DrawerCustom(),
          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: Center(
                  child: Text("It's rainy here"),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        width: width*0.9,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color: grey
                          )
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 22,
                              child: TextField(
                                cursorColor: black,
                                style: TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                    hintText: 'Район',
                                    labelStyle: TextStyle(fontSize: 18),
                                    contentPadding: EdgeInsets.only(left: 17),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                              ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(left: BorderSide(width: 1,color:grey))
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.search_sharp, size: 30, color: grey),
                                  onPressed: () {},
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      Container(
                        height:20,
                        width: width,
                        color: white,
                      ),
                      Container(
                        width: width,
                        color: Color.fromRGBO(239, 255, 244, 1.0),
                        height: 237,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Рядом',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage('assets/forum_images/pushkino.png'),
                                    ),
                                  title: Text('Улица Александра Пушкина', 
                                          style: TextStyle(
                                            fontSize: 17
                                          ),),
                                ),
                              )
                          ],),
                        ),
                      ),
                      Container(
                        width: width,
                        color: Color.fromRGBO(255, 254, 242, 1.0),
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Популярные',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    ),
                                ),
                              ),
                              
                          ],),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
