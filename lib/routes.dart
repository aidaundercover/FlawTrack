import 'package:flutter/material.dart';
import 'package:flawtrack/views/auth/signup.dart';
import 'package:flawtrack/views/auth/forgotpassword.dart';
import 'package:flawtrack/home_widget_citizen.dart';
import 'package:flawtrack/home_widget_volunteer.dart';


class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-signin';
  static const String homeCitizen = '/home_citizen';
  static const String homeVolunteer = '/home_volunteer';
  static const String forgotPassword = '/forgot-password';

  static get authFormType => null;

  static get key => null;


  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => SignUpView(key: key, authFormType: authFormType),
      homeCitizen: (context) => HomeCitizen(),
      homeVolunteer: (context) => HomeVolunteer(),
      forgotPassword: (context) => ForgotPassword(),
    };
  }
}
