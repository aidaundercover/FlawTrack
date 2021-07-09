import 'package:flutter/material.dart';
import 'package:flawtrack/views/auth/signin.dart';
import 'package:flawtrack/views/auth/signup.dart';
import 'package:flawtrack/views/auth/forgotpassword.dart';
import 'package:flawtrack/home_widget.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-signin';
  static const String authSignup = '/auth-signup';
  static const String home = '/home';
  static const String forgotPassword = '/forgot-password';


  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => LoginPage(),
      home: (context) => Home(),
      forgotPassword: (context) => ForgotPassword(),
    };
  }
}
