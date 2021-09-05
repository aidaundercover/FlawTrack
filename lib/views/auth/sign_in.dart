import 'package:flawtrack/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../const.dart';
import '../../routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.signUp);
        },
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            primaryColor.withOpacity(0.6),
            primaryColor,
            yellow.withOpacity(0.8),
            primaryColor.withOpacity(0.35)
          ],
          begin: Alignment.topLeft
          )),
          height: 48,
          alignment: Alignment.center,
          child: Text('ЗАРЕГИСТРИРОВАТЬСЯ',
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: white)),
        ),
      ),
      backgroundColor: lightYellow,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          SizedBox(
            height: 30,
          ),
          Text('ДОБРО ПОЖАЛОВАТЬ!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 40),
          Container(
              color: white,
              width: _width * 0.87,
              height: 225,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Вход',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 27),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: _width * 0.76,
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                onSaved: (input) =>
                                    _emailController.text = input!,
                                validator: (input) {
                                  EmailValidator.validate(input);
                                },
                                decoration: InputDecoration(
                                  hintText: 'E-mail',
                                  hintStyle: TextStyle(
                                      color: grey,
                                      fontFamily: 'Arial',
                                      fontSize: 14),
                                  filled: false,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: grey),
                                      borderRadius: BorderRadius.circular(0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: grey, width: 2),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2)),
                                ),
                              )),
                          SizedBox(height: 20),
                          Container(
                              width: _width * 0.76,
                              child: TextFormField(
                                controller: _passwordController,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                validator: (input) {
                                  PasswordValidator.validate(input);
                                },
                                onSaved: (input) =>
                                    _passwordController.text = input!,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 19),
                                    color: Color.fromRGBO(168, 168, 168, 1.0),
                                    onPressed: _toggle,
                                  ),
                                  hintText: 'Пароль',
                                  hintStyle: TextStyle(
                                      color: grey,
                                      fontFamily: 'Arial',
                                      fontSize: 14),
                                  filled: false,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: grey),
                                      borderRadius: BorderRadius.circular(0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: grey, width: 2),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2)),
                                ),
                                obscureText: _obscureText,
                              )),
                        ],
                      )),
                ],
              )),
          SizedBox(height: 20),
          Ink(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.forgotPassword);
              },
              child: Text(
                'Забыли свой пароль?',
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              try {
                await AuthService().signInWithEmail(
                    email: _emailController.text,
                    password: _passwordController.text).then((value) => {
                    });
                
              } catch (e) {
                print(e);
              }
            },
            child: Container(
              width: _width * 0.87,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      colors: [primaryColor.withOpacity(0.9), primaryColor])),
              height: 43,
              child: Text(
                'ПРОДОЛЖИТЬ',
                style: TextStyle(
                  color: white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                child: Image(
                  image: AssetImage('assets/social/google_or.png'),
                  width: 30,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: primaryColor, width: 1),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(22),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                child: Image(
                  image: AssetImage('assets/social/apple_or.png'),
                  width: 30,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: primaryColor, width: 1),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(22),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                child: Image(
                  image: AssetImage('assets/social/fb_or.png'),
                  width: 30,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: primaryColor, width: 1),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(22),
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          GestureDetector(
            onTap: () {},
            child: Text("Еще нет аккаунта?",
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ]),
      ),
    );
  }

}
