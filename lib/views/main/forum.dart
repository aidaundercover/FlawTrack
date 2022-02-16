import 'package:flawtrack/models/ChatUser.dart';
import 'package:flawtrack/models/chatTile.dart';
import 'package:flawtrack/views/chat/kenesary.dart';
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
    Tab(text: 'ЧАТ'),
    Tab(text: 'ІЗДЕУ'),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    List<ChatUsers> chatUsers = [
      ChatUsers(
          text: "ЖК Кенесары",
          secondaryText: "И что вы думаете?",
          image: "assets/forum_images/useravatar.png",
          time: "Сейчас"),
      ChatUsers(
          text: "Улица Амангельды",
          secondaryText: "Да, сегодня в шатре",
          image:"assets/forum_images/useravatar.png",
          time: "Вчера"),
      ChatUsers(
          text: "Улица Пушкинская",
          secondaryText: "ахахахаххаха",
          image:"assets/forum_images/useravatar.png",
          time: "31 Сен"),
      ChatUsers(
          text: "Аягуль Арамова",
          secondaryText: "Предусмотрительно",
          image: "assets/forum_images/useravatar.png",
          time: "28 Mar"),
      ChatUsers(
          text: "Алим Женисов",
          secondaryText: "Состояние потока - лучшее",
          image: "assets/forum_images/useravatar.png",
          time: "23 Mar"),
      ChatUsers(
          text: "Jacob Pena",
          secondaryText: "will update you in evening",
          image: "assets/forum_images/useravatar.png",
          time: "17 Mar"),
      ChatUsers(
          text: "Andrey Jones",
          secondaryText: "Can you please share the file?",
          image: "assets/forum_images/useravatar.png",
          time: "24 Feb"),
      ChatUsers(
          text: "John Wick",
          secondaryText: "How are you?",
          image: "assets/forum_images/useravatar.png",
          time: "18 Feb"),
    ];

    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        // The Builder widget is used to have a different BuildContext to access
        // closest DefaultTabController.
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 60,
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
                  child: Container(
                    height: 1000,
                    child: ListView.builder(
                      itemCount: chatUsers.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 16),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ConversationList(
                            name: chatUsers[index].text,
                            messageText: chatUsers[index].secondaryText,
                            imageUrl: chatUsers[index].image,
                            time: chatUsers[index].time,
                            isMessageRead:
                                (index == 0 || index == 3) ? true : false,
                      
                        );
                      },
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width * 0.9,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1, color: grey)),
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
                                      border: Border(
                                          left: BorderSide(
                                              width: 1, color: grey))),
                                  child: IconButton(
                                    icon: Icon(Icons.search_sharp,
                                        size: 30, color: grey),
                                    onPressed: () {},
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                        width: width,
                        color: white,
                      ),
                      Container(
                        width: width,
                        color: Color.fromRGBO(239, 255, 244, 1.0),
                        height: 240,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Жанында',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  width: width * 0.92,
                                  height: 65,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          'assets/forum_images/kenesary.png'),
                                    ),
                                    title: Text(
                                      'Улица Майры 49',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Card(
                                child: Container(
                                  width: width * 0.92,
                                  height: 65,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          'assets/forum_images/abylai_khan.png'),
                                    ),
                                    title: Text(
                                      'Дом Ткачева 5',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(flex: 9, child: Container()),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Image.asset(
                                          'assets/forum_images/dots.png',
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Таралған',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Card(
                                    child: Container(
                                      width: width * 0.92,
                                      height: 65,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: AssetImage(
                                              'assets/forum_images/kabanbay.png'),
                                        ),
                                        title: Text(
                                          'ЖК GreenCity',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Card(
                                    child: Container(
                                      width: width * 0.92,
                                      height: 65,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: AssetImage(
                                              'assets/forum_images/f1.png'),
                                        ),
                                        title: Text(
                                          'Дом Ткачева 5',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Card(
                                    child: Container(
                                      width: width * 0.92,
                                      height: 65,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: AssetImage(
                                              'assets/forum_images/al_farabi.png'),
                                        ),
                                        title: Text(
                                          'Дом Ткачева 5',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(flex: 9, child: Container()),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Image.asset(
                                              'assets/forum_images/dots.png',
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
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
