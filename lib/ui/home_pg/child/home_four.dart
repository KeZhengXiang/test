
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/global/global.dart';


//我-one
class HomeFour extends StatefulWidget {
  final double height;
  final String title;
  HomeFour(this.height,{Key key, this.title = "我"}) : super(key: key);

  @override
  _HomeFourState createState() => _HomeFourState();
}

class _HomeFourState extends State<HomeFour> {
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