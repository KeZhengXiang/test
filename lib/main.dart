import 'package:flutter/material.dart';
import 'package:myapp/ui/loading.dart';
import 'package:myapp/test/test_toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my-app',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),

      home: Loading(),
    );
  }
}
//
//import 'package:flt_video_player/flt_video_player.dart';
//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  VideoPlayerController _controller;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = VideoPlayerController.path(
//        "https://www.runoob.com/try/demo_source/mov_bbb.mp4")
//      ..initialize().then((value){
//        _controller.play();
//        setState(() {
//
//        });
//      });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Simple Demo",
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Simple Demo"),
//        ),
//        body: AspectRatio(
//          aspectRatio: 1.8,
//          child: VideoPlayer(_controller),
//        ),
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    _controller?.dispose();
//  }
//}