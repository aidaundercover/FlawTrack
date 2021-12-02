import 'package:flawtrack/services/auth_service.dart';
import 'package:flawtrack/views/first_view.dart';
import 'package:flawtrack/views/settings/settings_main.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/const.dart';

class DrawerCustom extends StatefulWidget {
  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Color.fromRGBO(245, 245, 245, 1.0),
          child: Column(
            children: [
              Flexible(
                flex: 10,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          decoration:
                              BoxDecoration(color: primaryColor, boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ]),
                          height: 143,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              minRadius: 27,
                                              maxRadius: 32,
                                              backgroundColor: white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "A",
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 35.0,
                                                      color: primaryColor),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              "Aida Abkenova",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "aida.undercover@gmail.com",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12),
                                              textAlign: TextAlign.start,
                                            ),
                                          ]),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.more_vert_rounded,
                                          size: 20, color: Colors.black),
                                      onPressed: () {},
                                    )
                                  ]),
                            ],
                          )),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Icon(Icons.location_on_outlined,
                                    size: 23, color: black),
                                SizedBox(width: 15),
                                Text("$addressGlobal",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {}),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Image(
                                    image: AssetImage('assets/coin.png'),
                                    width: 23,
                                    height: 23),
                                SizedBox(width: 15),
                                Text('' + 'баллов',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {}),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Icon(Icons.map, size: 23, color: black),
                                SizedBox(width: 15),
                                Text('Карта',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {}),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Icon(Icons.settings,
                                    size: 23,
                                    color: Color.fromRGBO(92, 92, 92, 1.0)),
                                SizedBox(width: 15),
                                Text('Настройки',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingsMainPage()));
                                    }),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                ImageIcon(AssetImage('assets/theme.png'),
                                    size: 23, color: black),
                                SizedBox(width: 15),
                                Text('Темная тема',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  },
                                  activeTrackColor: lightYellow,
                                  activeColor: primaryColor,
                                ),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Icon(Icons.contact_support_outlined,
                                    size: 23,
                                    color: Color.fromRGBO(92, 92, 92, 1.0)),
                                SizedBox(width: 15),
                                Text('Поддержка',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingsMainPage()));
                                    }),
                              )
                            ]),
                      ),
                    ]),
              ),
              Flexible(
                  flex: 1,
                  child: Row(children: [
                    SizedBox(width: 20),
                    Icon(Icons.exit_to_app, size: 23, color: Colors.black),
                    SizedBox(width: 15),
                    InkWell(
                        child: Text('Sign Out',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                        onTap: () {
                          AuthService.logOut();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstView()));
                        }),
                  ]))
            ],
          )),
    );
  }
}
