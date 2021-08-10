import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/home_widget_citizen.dart';
import 'package:flawtrack/services/custom_colors.dart';
import 'package:flawtrack/views/first_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flawtrack/routes.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flawtrack/widgets/provider_widget.dart';
import 'package:flawtrack/services/auth_service.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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


  @override
  void didChangePlatformBrightness() {
    setState(() {
      colors = CustomColors(WidgetsBinding.instance!.window.platformBrightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      db: FirebaseFirestore.instance,
      colors: colors,
      key: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Roboto'
            ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Roboto'
            ),
        home: HomeController(),
        routes: AppRoutes.define(),
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeCitizen() : FirstView();
        }
        return Container();
      },
    );
  }
}



