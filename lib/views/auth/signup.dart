import 'package:flawtrack/services/auth_service.dart';
import 'package:flawtrack/views/auth/verify_email.dart';
import 'package:flawtrack/views/terms_of_policy.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
import '../../routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordCheckController;
  String dropdownValue = 'Нет';
  Color textColor = grey.withOpacity(0.7);

  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _nameController = TextEditingController(text: "");
    _passwordCheckController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.signIn);
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            primaryColor.withOpacity(0.6),
            primaryColor,
            yellow,
            primaryColor
          ], begin: Alignment.topLeft)),
          height: 48,
          alignment: Alignment.center,
          child: Text('ВОЙТИ',
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
          Container(
              color: white,
              width: _width * 0.87,
              height: 510,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Создать аккаунт',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 33),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: _width * 0.76,
                              child: TextFormField(
                                controller: _nameController,
                                style: TextStyle(
                                  color: grey,
                                  fontSize: 14,
                                ),
                                onSaved: (input) =>
                                    _nameController.text = input!,
                                validator: (input) {
                                  NameValidator.validate(input);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Имя',
                                  hintStyle: TextStyle(
                                      color: textColor,
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
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: grey,
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
                            height: 45,
                            decoration: BoxDecoration(
                                color: white,
                                border: Border.all(color: grey, width: 1)),
                            child: Center(
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                iconSize: 30,
                                elevation: 16,
                                hint: Text(
                                  'Волонетер ли вы?',
                                  style:
                                      TextStyle(fontSize: 14, color: textColor),
                                ),
                                style: const TextStyle(color: grey),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                    if (dropdownValue == 'Нет') {
                                      volunteer = false;
                                    } else if (dropdownValue == 'Да') {
                                      volunteer = true;
                                    }
                                  });
                                },
                                items: <String>[
                                  'Нет',
                                  'Да'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      width: _width * 0.60,
                                      child: Text(value)),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                              width: _width * 0.76,
                              child: TextFormField(
                                controller: _passwordController,
                                style: TextStyle(
                                  color: grey,
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
                                      color: textColor,
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
                          SizedBox(height: 20),
                          Container(
                              width: _width * 0.76,
                              child: TextFormField(
                                controller: _passwordCheckController,
                                style: TextStyle(
                                  color: grey,
                                  fontSize: 14,
                                ),
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Пожалуйста потвердите пароль введя его повторно';
                                  } else if (input !=
                                      _passwordController.text) {
                                    return 'Пароль должен совпадать';
                                  }
                                  return null;
                                },
                                onSaved: (input) =>
                                    _passwordCheckController.text = input!,
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
                                  hintText: 'Потверждение пароля',
                                  hintStyle: TextStyle(
                                      color: textColor,
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
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsOfPolicy()));
                    },
                    child: Text(
                      'Создавая учетную запись, вы соглашаетесь с нашей\nПолитикой конфиденциальности',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )),
          SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              try {
                await AuthService.signupWithEmail(
                        email: _emailController.text,
                        password: _passwordController.text,
                        name: _nameController.text,
                        isVolunteer: volunteer)
                    .then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => VerifyScreen()));
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
              alignment: Alignment.center,
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
