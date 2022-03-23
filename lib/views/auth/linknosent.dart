import 'package:flutter/material.dart';

class LinkNoSent extends StatefulWidget {
  const LinkNoSent({Key? key}) : super(key: key);

  @override
  State<LinkNoSent> createState() => _LinkNoSentState();
}

class _LinkNoSentState extends State<LinkNoSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

      ),
      body: Column(
        children: [
          Text(
            ''
          )
        ]
      ),
    );
  }
}
