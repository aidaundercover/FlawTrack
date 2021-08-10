import 'package:flutter/material.dart';
import '../../const.dart';

class SwitchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width*0.82,
        height: 335,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'FlawTrack ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),
                ),
                Text(
                  'хочет поменять',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22
                  ),
                ),
              ],
            ),
            Text(
                  'статус вашего аккаунта',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22
                  ),
            ),
            SizedBox(height: 40,),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email/Номер телефона',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1)
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1)
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 45,),
            Container(
              width: MediaQuery.of(context).size.width*0.76,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      cancelButton(context),
                      SizedBox(width: 18,),
                      okButton(context)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  cancelButton( BuildContext context) {
    return TextButton(
      child: Container(
        width: 72,
        height: 24,
        color: Color.fromRGBO(246, 242, 242, 1),
        child: Text(
          'Отмена',
          style: TextStyle(
            fontSize: 10,
            color: grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  okButton( BuildContext context) {
    return TextButton(
      child: Container(
        width: 72,
        height: 24,
        color: primaryColor.withOpacity(0.6),
        child: Text(
          'OK',
          style: TextStyle(
            fontSize: 10,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
