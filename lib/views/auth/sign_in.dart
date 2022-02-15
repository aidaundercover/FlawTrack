import 'package:flawtrack/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import '../../const.dart';
import '../../routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomSheet: GestureDetector(
        onTap: () async {
          await Navigator.of(context).pushReplacementNamed(AppRoutes.signUp);
        },
        child: Container(
          width: _width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            primaryColor.withOpacity(0.6),
            primaryColor,
            yellow,
            primaryColor
          ], begin: Alignment.topLeft)),
          height: 48,
          alignment: Alignment.center,
          child: Text(AppLocalizations.of(context).signup,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: white)),
        ),
      ),
      backgroundColor: lightYellow,
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            SizedBox(
              height: 50,
            ),
            Text(AppLocalizations.of(context).welcome,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 40),
            Container(
                color: white,
                width: _width * 0.87,
                height: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).signin,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 27),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: _width * 0.76,
                                child: TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  onSaved: (input) =>
                                      _emailController.text = input!,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    if (!EmailValidator.validate(value)) {
                                      return "Please enter a valid email address";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText:
                                        AppLocalizations.of(context).email,
                                    hintStyle: TextStyle(
                                        color: grey,
                                        fontFamily: 'Arial',
                                        fontSize: 14),
                                    filled: false,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: grey),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: grey, width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2)),
                                  ),
                                )),
                            SizedBox(height: 20),
                            Container(
                                width: _width * 0.76,
                                child: TextFormField(
                                  controller: _passwordController,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onSaved: (input) =>
                                      _passwordController.text = input!,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          size: 19),
                                      color: Color.fromRGBO(168, 168, 168, 1.0),
                                      onPressed: _toggle,
                                    ),
                                    hintText:
                                        AppLocalizations.of(context).password,
                                    hintStyle: TextStyle(
                                        color: grey,
                                        fontFamily: 'Arial',
                                        fontSize: 14),
                                    filled: false,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: grey),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: grey, width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2)),
                                  ),
                                  obscureText: _obscureText,
                                )),
                          ],
                        )),
                  ],
                )),
            SizedBox(height: 20),
            Ink(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.forgotPassword);
                },
                child: Text(
                  AppLocalizations.of(context).forgotpass,
                  style: TextStyle(
                    color: grey.withOpacity(0.6),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await AuthService.signInWithEmail(
                            email: _emailController.text,
                            password: _passwordController.text,
                            context: context)
                        .then((value) => {});
                  } catch (e) {
                    Fluttertoast.showToast(msg: e.toString());
                  }
                }
              },
              child: Container(
                width: _width * 0.87,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        colors: [primaryColor.withOpacity(0.9), primaryColor])),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Container(
              width: _width * 0.8,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                    child: Image(
                      image: AssetImage('assets/social/google_or.png'),
                      width: 30,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor, width: 1),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    child: Image(
                      image: AssetImage('assets/social/apple_or.png'),
                      width: 30,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor, width: 1),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    child: Image(
                      image: AssetImage('assets/social/fb_or.png'),
                      width: 30,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor, width: 1),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            GestureDetector(
              onTap: () {},
              child: Text(AppLocalizations.of(context).donthaveyet,
                  style: TextStyle(
                    color: grey,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
