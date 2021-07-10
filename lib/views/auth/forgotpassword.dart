import 'package:flutter/material.dart';
import 'package:flawtrack/const.dart';
import 'package:flawtrack/routes.dart';
import 'package:flawtrack/services/auth_service.dart';

var warning;

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 0, 50),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back,
                            size: 20, color: primaryColor),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.authLogin);
                        }),
                  ],
                )),
            Image(
                image: AssetImage('assets/images/forgot_password_girl.png'),
                width: MediaQuery.of(context).size.width / 1.32,
                height: MediaQuery.of(context).size.width / 1.32),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 23),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextFormField(
                  controller: emailRecover,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'Arial',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  validator: (String? input) {
                    if (input!.isEmpty) {
                      return 'Please enter you e-mail';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'exmaple@mail.com',
                    hintStyle: TextStyle(
                        color: lightYellow, fontFamily: 'Arial', fontSize: 15),
                    filled: false,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: lightYellow),
                        borderRadius: BorderRadius.circular(0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: lightYellow, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red, width: 2)),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  height: 48,
                  child: TextButton(
                    onPressed: () {
                      try {
                        Navigator.of(context).pushNamed(AppRoutes.authLogin);
                        warning =
                            "A password reset link has been sent to $emailRecover";
                      } catch (e) {
                        return warning;
                      }
                    },
                    child: Container(
                      color: primaryColor,
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: white,
                          fontFamily: 'Arial',
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
