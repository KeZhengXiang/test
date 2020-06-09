//测试主页
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/test/test_easy_dialog.dart';
import 'package:myapp/test/test_flutter_custom_dailog.dart';
import 'package:myapp/test/test_progress_dialog.dart';
import 'package:myapp/test/test_toast.dart';

import 'comment/comment.dart';
import 'constrained_box.dart';
import 'media/test_media.dart';


class TestMain extends StatefulWidget {
  final String title;
  TestMain({Key key, this.title = "测试"}) : super(key: key);

  @override
  _TestMainState createState() => _TestMainState();
}

class _TestMainState extends State<TestMain> {

  @override
  Widget build(BuildContext context) {
//    LogUtils.log("\n "
//        "设备宽度；${Global.screenWidth}\n "
//        "设备高度；${Global.screenHeight}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            RaisedButton(
              child: Text("test_toast"),
              disabledColor: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestToast();
                }));
              },
            ),
            RaisedButton(
              child: Text("test_progress_dialog"),
              disabledColor: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestProgressDialog();
                }));
              },
            ),
            //TestEasyDialog
            RaisedButton(
              child: Text("test_easy_dialog"),
              disabledColor: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestEasyDialog();
                }));
              },
            ),
            RaisedButton(
              child: Text("test_flutter_custom_dialog"),
              disabledColor: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestFlutterCustomDailog();
                }));
              },
            ),

            RaisedButton(
              child: Text("test_constrained_box  约束盒子组件"),
              disabledColor: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestConstrainedBox();
                }));
              },
            ),

            //==========

            RaisedButton(
              child: Text("评论弹窗-类抖音"),
              disabledColor: Colors.lightBlueAccent,
              onPressed: (){
                getCommentDialog(Global.screenWidth, (Global.screenHeight * 0.7), context: context);
              },
            ),

            RaisedButton(
              child: Text("媒体（打开照片库、拍摄照片、打开视频库、拍摄视频） image_picker"),
              disabledColor: Colors.lightBlueAccent,
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestMedia(title: "媒体（打开照片库、拍摄照片、打开视频库、拍摄视频） image_picker",);
                  }));
              },
            ),


          ],
        ),
      ),
    );
  }
}