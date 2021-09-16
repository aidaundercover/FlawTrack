import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/const.dart';
import 'package:flawtrack/services/custom_colors.dart';
import 'package:flawtrack/views/error/smth_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flawtrack/routes.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flawtrack/widgets/provider_widget.dart';
import 'package:flawtrack/services/auth_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  /// STEP 2. Pass your root widget (MyApp) along with Catcher configuration:
  ///
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  var colors = CustomColors(WidgetsBinding.instance!.window.platformBrightness);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void didChangePlatformBrightness() {
    setState(() {
      colors = CustomColors(WidgetsBinding.instance!.window.platformBrightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SomethingWentWrong();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return Provider(
              auth: AuthService(),
              db: FirebaseFirestore.instance,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    brightness: Brightness.light, fontFamily: 'Roboto'),
                darkTheme: ThemeData(
                    brightness: Brightness.dark, fontFamily: 'Roboto'),
                home: AuthService().handleAuth(),
                routes: AppRoutes.define(),
              ),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return SpinKitPouringHourGlass(
            color: primaryColor,
            size: 50.0,
            
          );
        });
  }
}
