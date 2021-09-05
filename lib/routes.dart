import 'package:flawtrack/views/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flawtrack/views/auth/signup.dart';
import 'package:flawtrack/views/auth/forgotpassword.dart';
import 'package:flawtrack/home_widget_citizen.dart';
import 'package:flawtrack/home_widget_volunteer.dart';


class AppRoutes {
  AppRoutes._();

  static const String signIn = '/signin';
  static const String signUp = '/signup';
  static const String homeCitizen = '/home_citizen';
  static const String homeVolunteer = '/home_volunteer';
  static const String forgotPassword = '/forgot-password';
  static const String convertUser = '/convertUser';

  


  static Map<String, WidgetBuilder> define() {
    return {
      signIn: (BuildContext context) => LoginPage(),
      signUp: (BuildContext context) => SignUp(),
      homeCitizen: (BuildContext context) => HomeCitizen(),
      homeVolunteer: (BuildContext context) => HomeVolunteer(),
      forgotPassword: (BuildContext context) => ForgotPassword(),
    };
  }
}
