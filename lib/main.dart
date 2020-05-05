import 'package:flutter/material.dart';
import 'package:my_app/ui/launchScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my-app',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),

      home: LaunchScreen(),
    );
  }
}

