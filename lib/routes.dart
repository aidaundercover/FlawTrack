import 'package:flutter/material.dart';
import 'package:flawtrack/views/auth/signup.dart';
import 'package:flawtrack/views/auth/forgotpassword.dart';
import 'package:flawtrack/home_widget_citizen.dart';
import 'package:flawtrack/home_widget_volunteer.dart';


class AppRoutes {
  AppRoutes._();

  static const String signIn = '/auth-signin';
  static const String signUp = '/auth-signup';
  static const String homeCitizen = '/home_citizen';
  static const String homeVolunteer = '/home_volunteer';
  static const String forgotPassword = '/forgot-password';
  static const String anonymousSignIn = '/anonymousSignIn';
  static const String convertUser = '/convertUser';

  static get authFormType => null;

  static get key => null;


  static Map<String, WidgetBuilder> define() {
    return {
      signIn: (context) => SignUpView(key: key,authFormType: AuthFormType.signIn),
      signUp: (context) => SignUpView(key: key, authFormType: AuthFormType.signUp),
      homeCitizen: (context) => HomeCitizen(),
      homeVolunteer: (context) => HomeVolunteer(),
      forgotPassword: (context) => ForgotPassword(),
      anonymousSignIn : (context) => SignUpView(key: key, authFormType: AuthFormType.anonymous),
      convertUser : (context) => SignUpView(key: key,authFormType: AuthFormType.convert),
    };
  }
}
