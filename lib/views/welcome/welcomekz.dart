import 'package:flawtrack/const.dart';
import 'package:flawtrack/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomeKz extends StatefulWidget {
  const WelcomeKz({Key? key}) : super(key: key);

  @override
  _WelcomeKzState createState() => _WelcomeKzState();
}

class _WelcomeKzState extends State<WelcomeKz> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    Widget _buildImage(String assetName) {
      return Image.asset(
        'assets/welcome/$assetName',
        width: _width * 0.72,
        alignment: Alignment.center,
      );
    }

    const pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 27.0, fontWeight: FontWeight.w700, color: darkBlue),
        pageColor: Colors.white,
        bodyTextStyle: TextStyle(fontSize: 19, color: grey));

    final Shader linearGradient = LinearGradient(
      colors: <Color>[primaryColor, primaryColor.withOpacity(0.5)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Мәселелерді\N қала картасына бекітіңіз",
          image: _buildImage('welone.png'),
          body:
              'Сізде әр түрлі санаттағы мәселелерді жалпы картада белгілеу және құжаттарды тіркеу мүмкіндігі бар',
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Аудан тұрғындарымен байланыста болыңыз",
          image: _buildImage('weltwo.png'),
          body:
              'Тұрғын үй кешендерін қызықтыратын чаттарға қосылыңыз және әлеуметтік мәселелерді бірге шешіңіз',
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Жетістіктер үшін ұпай алыңыз",
          image: _buildImage('welthree.png'),
          body:
              'Проблемалары немесе түзетулері бар картаны толтыру үшін сізге қосымшада артықшылықтар беретін ұпайлар беріледі',
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      showDoneButton: true,
      skip: const Text('Пропустить',
          style: TextStyle(
            color: grey,
            fontSize: 16,
          )),
      done: Container(
          width: 68,
          height: 68,
          decoration:
              BoxDecoration(color: white, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4)),
            BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: -4,
                offset: Offset(0, 4))
          ]),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient,
                ),
              ))),
      next: Container(
          width: 68,
          height: 68,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: white, boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4)),
            BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: -4,
                offset: Offset(0, 4))
          ]),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/arrow.png',
              width: 30,
            ),
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        spacing: const EdgeInsets.symmetric(horizontal: 13.0),
        activeSize: Size(22.0, 10.0),
        activeColor: primaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
