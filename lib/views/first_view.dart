
import 'package:flawtrack/const.dart';
import 'package:flawtrack/l10n/l10n.dart';
import 'package:flawtrack/routes.dart';
import 'package:flawtrack/services/locale_provider.dart';
import 'package:flawtrack/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  


class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

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
            decoration: BoxDecoration(color: white, boxShadow: [
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
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: MyStatefulWidget(),
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {




  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<LocaleProvider>(context);
    var locale = provider.locale ?? Locale('en');
    final _width = MediaQuery.of(context).size.width;

    return DropdownButton<Locale>(
      iconEnabledColor: darkBlue,
      iconDisabledColor: grey,
      itemHeight: 55,
      value: locale,
      onTap: () {
      final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

      provider.setLocale(locale);
      },
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: black),
      icon: Padding(
        padding: EdgeInsets.only(left: _width*0.35),
        child: const Icon(
          Icons.arrow_drop_down_outlined,
          size: 30,
        ),
      ),
      iconSize: 30,
      onChanged: (Locale? newValue) {
        setState(() {
          locale = newValue!;
        });
      },
      items: L10n.all.map(
          (locale) {
            final flag = L10n.getFlag(locale.languageCode);

            return DropdownMenuItem(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 22),
                ),
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
    );
  }
}
