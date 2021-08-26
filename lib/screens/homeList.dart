import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          'Hi, here your moments..',
          style: TextStyle(fontSize: 25.0),
        ),
        elevation: 0,
        backgroundColor: Color(0xffff16fa1).withOpacity(0.3),
      ),
      backgroundColor: Color(0xffff16fa1).withOpacity(0.6),
      body: Container(),
    );
  }
}
