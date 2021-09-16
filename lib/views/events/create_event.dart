import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  var style = TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
  var color = Color.fromRGBO(166, 168, 183, 1);
  var hintStyle =
      TextStyle(fontSize: 12, color: Color.fromRGBO(166, 168, 183, 1));

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 60,
          centerTitle: true,
          title: Text(
            'Создать мероприятие',
            style: TextStyle(
                color: black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          ),
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
          child: Center(
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      Text(
                        'Заголовок',
                        style: style,
                      ),
                      Container(
                        width: width * 85,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: color, width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2)),
                              hintText: 'Субботник в честь дня экологии',
                              hintStyle: hintStyle,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 14, 0, 14)),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                      Text(
                        'Местопрохождение',
                        style: style,
                      ),
                      Text(
                        'Время',
                        style: style,
                      ),
                      Text(
                        'Описание',
                        style: style,
                      ),
                      Text(
                        'Ответственные лицо/организация',
                        style: style,
                      ),
                      Text(
                        'Изображения',
                        style: style,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          color: color,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              width: width * 85,
                              height: 42,
                              color: white,
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.add_photo_alternate,
                                  color: color,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {}, 
                  child: Container(
                    width: 175,
                    height: 42,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                    'Публиковать',
                    style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                )
              ],
            ),
          ),
        ));
  }
}
