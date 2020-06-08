import 'package:flutter/material.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/ui/loading.dart';

void main(){
//  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  Global();
  Global.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my-app',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
    themeMode: ThemeMode.dark,
      home: Loading(),
    );
  }
}