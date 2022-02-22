import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flawtrack/views/profile/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../const.dart';

class ProfuleCard extends StatefulWidget {
  final String name;
  const ProfuleCard({required this.name});

  @override
  _ProfuleCardState createState() => _ProfuleCardState();
}

class _ProfuleCardState extends State<ProfuleCard> {
  File? image;
  String? imageUrl;
  Future<String> profImg = FirebaseStorage.instance
      .ref()
      .child('user/${FirebaseAuth.instance.currentUser!.uid}')
      .getDownloadURL();

  final _storage = FirebaseStorage.instance;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final temporaryImage = File(image.path);

      final _storage = FirebaseStorage.instance;

      var snapshot = await _storage
          .ref()
          .child('users/${FirebaseAuth.instance.currentUser!.uid}')
          .putFile(temporaryImage);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({'profileImg': downloadUrl});
      setState(() {
        imageUrl = downloadUrl;
      });

      setState(() {
        this.image = temporaryImage;
      });
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: 'Access to camera was denied');
    }
  }

  Future<void> downloadURLExample() async {
    String downloadURL = await _storage
        .ref('users/${FirebaseAuth.instance.currentUser!.uid}.jpeg')
        .getDownloadURL();

    imageUrl = downloadURL;

    // Within your widgets:
    // Image.network(downloadURL);
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text(AppLocalizations.of(context).camera),
                  onTap: () => pickImage(ImageSource.camera),
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text(AppLocalizations.of(context).gallery),
                  onTap: () => pickImage(ImageSource.gallery),
                )
              ],
            ));
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                image != null
                    ? Image.file(
                        image!,
                        width: width * 0.28,
                        height: width * 0.28,
                        fit: BoxFit.cover,
                      )
                    : Positioned(
                        child: Container(
                            height: width * 0.28,
                            width: width * 0.28,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.person,
                                size: width * 0.22,
                                color: Color.fromRGBO(255, 235, 164, 1))),
                      ),
                Positioned(
                    right: 4,
                    bottom: 4,
                    child: IconButton(
                        onPressed: () {
                          showImageSource(context);
                        },
                        icon: Icon(Icons.add_a_photo,
                            size: 30, color: Colors.orange[700])))
              ]),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          volunteer
                              ? AppLocalizations.of(context).volunteer
                              : AppLocalizations.of(context).citizen,
                          style: TextStyle(
                              color: Color.fromRGBO(154, 154, 154, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      width: width * 0.25,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(231, 231, 231, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Пинов',
                                style: TextStyle(
                                    color: Color.fromRGBO(154, 154, 154, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                              Text(
                                '$pins',
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Баллов',
                                style: TextStyle(
                                    color: Color.fromRGBO(154, 154, 154, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                              Text(
                                '$points',
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Activity()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                child: Container(
                  width: width * 0.34,
                  height: 36,
                  alignment: Alignment.center,
                  child: Text(
                    'Активность',
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.34,
                  height: 36,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Изменить',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      Icon(Icons.arrow_right, size: 30, color: white)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
