import 'package:flawtrack/const.dart';
import 'package:flawtrack/routes.dart';
import 'package:flawtrack/views/welcome.dart';
import 'package:flutter/material.dart';


class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    String _selected= 'Русский';
    // ignore: unused_local_variable
    List<Map> _myJson = [
      {'id': '0', 'image': 'assets/welcome/russia.png', 'title': 'Русский'},
      {'id': '1', 'image': 'assets/welcome/kazakh.png', 'title': 'Қазақша'},
      {'id': '2', 'image': 'assets/welcome/usa.png', 'title': 'English'},
    ];

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: _height * 0.095,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select ",
                  style: TextStyle(
                      fontSize: 35,
                      color: darkBlue,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "language",
                  style: TextStyle(
                      fontSize: 35,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 70),
          Image.asset(
            'assets/welcome/lang_select.png',
            width: _width * 0.83,

          ),
          SizedBox(height: 40),
          Container(
            width: _width * 0.83,
            height: 60,
            decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
              BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, -2),
              )
            ]),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                          iconEnabledColor: darkBlue,
                          iconDisabledColor: grey,
                          itemHeight: 55,
                          value: _selected,
                          style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600, color: black),
                          icon: const Icon(Icons.arrow_drop_down_outlined, size: 30,),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selected = newValue!;
                            });
                          },
                          onTap: (){

                          },
                          items: _myJson.map((Map map) {
                            return DropdownMenuItem<String>(
                              value: map["title"].toString(),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Image.asset(
                                      map['image'],
                                      width: 42,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      map['title'],
                                      style: TextStyle(
                                          fontSize: 19, fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList()),
                          ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: _height * 0.024,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            child: Container(
              width: _width * 0.45,
              height: 43,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Welcome()));
            },
          ),
          SizedBox(height: _height * 0.05),
          Container(
            width: _width * 0.83,
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.signIn);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
