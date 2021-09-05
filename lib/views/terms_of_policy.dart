import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

class TermsOfPolicy extends StatelessWidget {
  const TermsOfPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            Color.fromRGBO(255, 250, 242, 1),
            white.withOpacity(0.3)
          ],
          begin: Alignment.bottomCenter
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {}, 
              child: Container(
                height: 43,
                width: 128,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.15),
                      blurRadius: 20,
                      offset: Offset(0,2)
                    ),
                    BoxShadow(
                      color: primaryColor.withOpacity(0.15),
                      blurRadius: 20,
                      offset: Offset(0,-2)
                    )
                  ]
                ),
                alignment: Alignment.center,
                child: Text(
                  'Отклонить',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                  ),
                ),
                )),
                ElevatedButton(
              onPressed: () {}, 
              child: Container(
                height: 43,
                width: 128,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.15),
                      blurRadius: 20,
                      offset: Offset(0,2)
                    ),
                    BoxShadow(
                      color: primaryColor.withOpacity(0.15),
                      blurRadius: 20,
                      offset: Offset(0,-2)
                    )
                  ]
                ),
                alignment: Alignment.center,
                child: Text(
                  'Принять',
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                  ),
                ),
                ))
        ],),
      ),
      
    );
  }
}
