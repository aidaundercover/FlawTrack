import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawtrack/services/auth_service.dart';
import 'package:flawtrack/services/locale_provider.dart';
import 'package:flawtrack/views/first_view.dart';
import 'package:flawtrack/views/settings/settings_main.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DrawerCustom extends StatefulWidget {
  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    getCurrentUserData();
  }

  static FirebaseFirestore _db = FirebaseFirestore.instance;

  Future getCurrentUserData() async {
    DocumentSnapshot ds = await _db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      nameGlobal = ds.get('name') ?? 'Loading';
      volunteer = ds.get('volunteer') ?? 'Loading';
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);

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
                                              "$nameGlobal",
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
                                              '${FirebaseAuth.instance.currentUser!.email.toString()}',
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
                                Text('$points' + ' ' + 'баллов',
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
                                Text(AppLocalizations.of(context).maps,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    lang = 0;
                                    provider.setLocale(Locale('ru'));
                                  });
                                },
                                child: Container(
                                    child: Center(child: Text('рус')),
                                    width: 45,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: lang == 0
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2, color: primaryColor))),
                              ),
                            ),
                            Flexible(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    lang = 1;
                                    provider.setLocale(Locale('kk'));
                                  });
                                },
                                child: Container(
                                    child: Center(child: Text('қаз')),
                                    width: 45,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: lang == 1
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2, color: primaryColor))),
                              ),
                            ),
                            Flexible(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    lang = 2;
                                    provider.setLocale(Locale('en'));
                                  });
                                },
                                child: Container(
                                    child: Center(child: Text('eng')),
                                    width: 45,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: lang == 2
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2, color: primaryColor))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(children: [
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
                      ]),
                    ],
                  ))
            ],
          )),
    );
  }
}
