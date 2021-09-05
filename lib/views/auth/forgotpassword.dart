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
  late TextEditingController _emailController;

  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Забыли пароль?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Image(
                image: AssetImage('assets/forgot.png'),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            SizedBox(height: 15),
            Container(
                width: MediaQuery.of(context).size.width * 0.81,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      validator: (String? input) {
                        if (input!.isEmpty) {
                          return 'Пожалуйста введите ваш e-mail';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'exmaple@mail.com',
                        hintStyle: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                        filled: false,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: lightYellow),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: lightYellow, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    TextButton(
                      onPressed: () {
                        AuthService().passwordReset(_emailController.text);
                        final snackBar = SnackBar(
                        content: const Text('Ссылка для востановления паролья была отправлена!'),
                        action: SnackBarAction(
                        label: 'Отмена',
                        onPressed: () {
                        },
                        ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.signIn);
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                primaryColor,
                                white,
                                primaryColor.withOpacity(0.35),
                                primaryColor
                              ], begin: Alignment.centerLeft),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'ОТПРАВИТЬ',
                            style: TextStyle(
                              color: white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
