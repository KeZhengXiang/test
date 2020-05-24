//测试主页
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/test/test_easy_dialog.dart';
import 'package:myapp/test/test_flutter_custom_dailog.dart';
import 'package:myapp/test/test_progress_dialog.dart';
import 'package:myapp/test/test_toast.dart';


class TestMain extends StatefulWidget {
  final String title;
  TestMain({Key key, this.title = "测试"}) : super(key: key);

  @override
  _TestMainState createState() => _TestMainState();
}

class _TestMainState extends State<TestMain> {

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}