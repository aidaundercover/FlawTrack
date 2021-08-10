import 'package:flawtrack/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacementNamed('/auth-signup');
  }
  

  @override
  Widget build(BuildContext context) {

    var _width = MediaQuery.of(context).size.width;

    Widget _buildImage(String assetName) {
    return Image.asset('assets/welcome/$assetName', 
          width: _width*0.72);
    }


    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w700, color: darkBlue),
      pageColor: Colors.white,
    );

    final Shader linearGradient = LinearGradient(
        colors: <Color>[
          primaryColor, 
          yellow
          ],
      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Image.asset(
              'assets/welcome/welone.png'
              )
          ),
      ),
      pages: [
        PageViewModel(
          title: "Закрпеляй проблемы на\n карте свеого города",
          image: _buildImage('welone.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Будьте на связи с жителями своего района",
          image: _buildImage('weltwo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Получай баллы за\n достижения",
          image: _buildImage('weltwo.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      showDoneButton: true,
      skip: const Text('Пропустить', style: TextStyle(color: grey, fontSize: 16,)),
      next: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4) 
            ),
            BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: -4,
                offset: Offset(0, 4) 
            )
          ]
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Done',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient,
            ),
          )
        )),
      done: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4) 
            ),
            BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: -4,
                offset: Offset(0, 4) 
            )
          ]
        ),
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