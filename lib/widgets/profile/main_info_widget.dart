import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainInfo extends StatefulWidget {
  const MainInfo({Key? key}) : super(key: key);

  @override
  State<MainInfo> createState() => _MainInfoState();
}

class _MainInfoState extends State<MainInfo> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).mainpage,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: black, fontWeight: FontWeight.w600, fontSize: 22),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 27,
                color: black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${addressGlobal.toString()}',
                style: TextStyle(color: black, fontSize: 18),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.mail_outline,
                size: 27,
                color: black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${FirebaseAuth.instance.currentUser!.email.toString()}',
                style: TextStyle(color: black, fontSize: 18),
              )
            ],
          ),
          SizedBox(height: 10),
          volunteer
              ? Row(
                  children: [
                    Icon(
                      Icons.self_improvement,
                      size: 27,
                      color: black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Visibility(
                      visible: volunteer,
                      child: Text(
                        AppLocalizations.of(context).organization,
                        style: TextStyle(color: black, fontSize: 18),
                      ),
                    )
                  ],
                )
              : Row(),
          
        ],
      ),
    );
  }
}
