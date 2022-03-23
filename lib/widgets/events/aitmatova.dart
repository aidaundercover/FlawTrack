import 'package:flutter/material.dart';


void aitmatova(BuildContext context, double width) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(255, 162, 141, 1.0),
            ),
            width: width * 0.8,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: IconButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           icon: Icon(Icons.close, color: grey)),
                  //     )
                  //   ],
                  // ),
                  SizedBox(height: 10),
        //         Container(
        //   height: 90,
        //   width: width*0.76,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(11.0),
        //         child: Container(
        //           width: 52,
        //           height: 52,
        //           decoration: BoxDecoration(
        //             color: Color.fromRGBO(255, 244, 244, 0.19),
        //             borderRadius: BorderRadius.circular(16)
        //           ),
        //           child: Image.asset('assets/events/broom.png'),
        //         ),
        //       ),
        //       Text('Субботник на Айтаматова',
        //               style: TextStyle(
        //                   color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          
        //     ],
        //   ),
        // ),
                  // Container(child: Image.file(img) ??),
                ],
              ),
            ),
          ),
        );
      });
}