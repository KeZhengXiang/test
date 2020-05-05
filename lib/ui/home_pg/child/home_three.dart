
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/global/global.dart';


//圈子
class HomeThree extends StatefulWidget {
  final double height;
  final String title;
  HomeThree(this.height,{Key key, this.title = "圈子"}) : super(key: key);

  @override
  _HomeThreeState createState() => _HomeThreeState();
}

class _HomeThreeState extends State<HomeThree> {
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