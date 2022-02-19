import 'package:flutter/material.dart';
import 'package:flawtrack/const.dart';
import 'package:flawtrack/routes.dart';
import 'package:flawtrack/services/auth_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


var warning;

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _emailController;

  final _key = GlobalKey<FormState>();


  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Text(
                AppLocalizations.of(context).forgotpass,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            SizedBox(height: 50),
            Center(
              child: Image(
                image: AssetImage('assets/forgot.png'),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            SizedBox(height: 15),
            Container(
                width: MediaQuery.of(context).size.width * 0.81,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Align(child: Text(AppLocalizations.of(context).email, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),), alignment: Alignment.centerLeft),
                      ),
                      Form(
                        key: _key,
                        child: Container(
                          decoration: BoxDecoration(
                                border: Border(
                                bottom: BorderSide(width: 2.0, color: black),
                                ),),
                        child:TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            validator: (input) {
                              if (input!.isEmpty) {
                                return AppLocalizations.of(context).warn2;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'exmaple@mail.com',
                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                              filled: false,
                              
                          
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      TextButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                              AuthService().passwordReset(_emailController.text);
                          final snackBar = SnackBar(
                          content: Text(AppLocalizations.of(context).emailwassend),
                          action: SnackBarAction(
                          label:  AppLocalizations.of(context).cancel,
                          onPressed: () {
                          },
                          ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.signIn);
                            }
                        },
                        child:  Container(
                width: _width * 0.87,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        colors: [primaryColor.withOpacity(0.7),primaryColor,yellow, primaryColor.withOpacity(0.8)])),
                height: 43,
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context).conti,
                  style: TextStyle(
                    color: white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                      ),
                    ],
                  ),
          ),
          ],
        ),
      ),
    );
  }
}
