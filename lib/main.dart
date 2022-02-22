import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawtrack/const.dart';
import 'package:flawtrack/services/custom_colors.dart';
import 'package:flawtrack/splash.dart';
import 'package:flawtrack/views/error/smth_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flawtrack/routes.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flawtrack/widgets/provider_widget.dart';
import 'package:flawtrack/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flawtrack/services/locale_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError= (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  var colors = CustomColors(WidgetsBinding.instance!.window.platformBrightness);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  late Position currentposition;
  String currentLocality = '';

  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentLocality = "${place.locality}";
        lat = position.latitude;
        long = position.longitude;

        cityGlobal = translate(currentLocality);
        addressGlobal = translate(currentLocality) + ', Казахстан';
        
      });
    } catch (e) {
      print(e);
    }
  }

  late User user;

  @override
  void initState() {
    super.initState();
    determinePosition();
  }

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return FutureBuilder(
            future: _initialization,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return SomethingWentWrong();
              }

              // Once complete, show your application
              if (!snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.done) {
                return ProviderMain(
                  auth: AuthService(),
                  db: FirebaseFirestore.instance,
                  child: MaterialApp(
                    locale: provider.locale,
                    debugShowCheckedModeBanner: false,
                    home: AuthService().handleAuth(),
                    routes: AppRoutes.define(),
                    supportedLocales: L10n.all,
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                  ),
                );
              }

              // Otherwise, show something whilst waiting for initialization to complete
              return SplashScreen();
            });
      });
}

String translate(String code) {
  print(code);
  switch (code) {
    case 'Nur-Sultan':
      return 'Нур-Султан';
    case 'Astana':
      return 'Нур-Султан';
    case 'Pavlodar':
      return 'Павлодар';
    case 'Aktau':
      return 'Актау';
    case 'Shymkent':
      return 'Шымкент';
    case 'Almaty':
      return 'Алматы';
    case 'Aktau':
      return 'Актау';
    case 'Aktau':
      return 'Актау';
    default:
      return 'Павлодар';
  }
}
