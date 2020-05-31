


import 'package:flutter/services.dart';

class GlobalFunction {

//======ios======

  static Future<int> getBatteryLevel() async {
    // Native channel
    const platform = const MethodChannel("samples.flutter.io/battery"); //分析1
    int result = 0;
    try {
      result = await platform.invokeMethod("getBatteryLevel"); //分析2
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }


  static Future<String> getSystemName() async {
    // Native channel
    const platform = const MethodChannel("samples.flutter.io/battery"); //分析1
    String result = "";
    try {
      result = await platform.invokeMethod("getSystemName"); //分析2
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

}