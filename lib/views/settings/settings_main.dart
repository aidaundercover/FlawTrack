import 'package:flutter/material.dart';

import '../../const.dart';

class SettingsMainPage extends StatefulWidget {
  const SettingsMainPage({Key? key}) : super(key: key);

  @override
  _SettingsMainPageState createState() => _SettingsMainPageState();
}

Widget title(String title) {
  return Padding(
    padding: EdgeInsets.fromLTRB(25, 30, 0, 20),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: TextStyle(
              color: primaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget tile(String title, IconData icon) {
  return Column(
    children: [
      Container(
        height: 55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Icon(
                    icon,
                    size: 30,
                    color: grey,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios_outlined,
                    size: 24, color: grey),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      Divider(
        color: divider,
      )
    ],
  );
}

Widget tileSocial(String title, String image1, String image2) {
  return Column(
    children: [
      Container(
        height: 55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Image.asset('')),
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios_outlined,
                    size: 20, color: grey),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      Divider(
        color: divider,
      )
    ],
  );
}

class _SettingsMainPageState extends State<SettingsMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Настройки",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: black),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined,
                  size: 27, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            title('Аккаунт'),
            Divider(
              color: divider,
            ),
            tile('Изменить профиль', Icons.person),
            tile(
              'Сменить пароль',
              Icons.keyboard_hide_sharp,
            ),
            title('Регулировать'),
            Divider(
              color: divider,
            ),
            tile('Уведомления', Icons.notification_important),
            tile('Язык', Icons.language),
            title(' Связать с социальными сетями'),
          ],
        ),
      ),
    );
  }
}
