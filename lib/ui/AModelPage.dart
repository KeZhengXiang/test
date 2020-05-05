
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AModelPage extends StatefulWidget {
  final double height;
  final String title;
  AModelPage(this.height,{Key key, this.title = "我"}) : super(key: key);

  @override
  _AModelPageState createState() => _AModelPageState();
}

class _AModelPageState extends State<AModelPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 10,
        height: 10,
        color: Colors.blue,
      ),
    );
  }
}