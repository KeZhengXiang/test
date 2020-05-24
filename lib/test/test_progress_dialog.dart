import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog pr;


class TestProgressDialog extends StatelessWidget {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
//    pr = new ProgressDialog(context,
//        type: ProgressDialogType.Normal, isDismissible: false);
//    pr = new ProgressDialog(context, type: ProgressDialogType.Download);

// Custom body test
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: true,
      showLogs: true,
//      customBody: LinearProgressIndicator(
//        valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
//        backgroundColor: Colors.white,
//      ),
    );

    pr.style(
//      message: 'Downloading file...',
      message:
      '我是进度对话框文本',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.bounceIn,
      progress: 0.0,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter progress_dialog'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text(
              'Show Dialog',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () async {
              await pr.show();

              Future.delayed(Duration(seconds: 2)).then((onvalue) {
                percentage = percentage + 30.0;
                print(percentage);

                pr.update(
                  progress: percentage,
                  message: "Please wait...请稍等",
                  progressWidget: Container(
//                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator()),
                  maxProgress: 100.0,
                  progressTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400),
                  messageTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600),
                );

                Future.delayed(Duration(seconds: 2)).then((value) {
                  percentage = percentage + 30.0;
                  pr.update(progress: percentage, message: "Few more seconds...再等等");

                  print(percentage);
                  Future.delayed(Duration(seconds: 2)).then((value) {
                    percentage = percentage + 30.0;
                    pr.update(progress: percentage, message: "Almost done...即将完成");
                    print(percentage);

                    Future.delayed(Duration(seconds: 2)).then((value) {
                      pr.hide().whenComplete(() {
                        print("hide Complete , pr.isShowing = ${pr.isShowing()}");
                      });
                      percentage = 0.0;
                    });
                  });
                });
              });

              // 保险
              Future.delayed(Duration(seconds: 10)).then((onValue) {
                print("PR status  ${pr.isShowing()}");
                if (pr.isShowing())
                  pr.hide().then((isHidden) {
                    print(isHidden);
                  });
                print("PR status  ${pr.isShowing()}");
              });
            }),
      ),
    );
  }
}

//class FirstScreen extends StatefulWidget {
//  @override
//  _FirstScreenState createState() => _FirstScreenState();
//}
//
//class _FirstScreenState extends State<FirstScreen> {
//  ProgressDialog pr;
//
//  @override
//  Widget build(BuildContext context) {
//    pr = new ProgressDialog(context, showLogs: true);
//    pr.style(message: 'Please wait...');
//
//    return Scaffold(
//      body: Center(
//        child: RaisedButton(
//          child: Text('Show dialog and go to next screen',
//              style: TextStyle(color: Colors.white)),
//          color: Colors.blueAccent,
//          onPressed: () {
//            pr.show();
//            Future.delayed(Duration(seconds: 3)).then((value) {
//              pr.hide().whenComplete(() {
//                Navigator.of(context).push(CupertinoPageRoute(
//                    builder: (BuildContext context) => SecondScreen()));
//              });
//            });
//          },
//        ),
//      ),
//    );
//  }
//}
//
//class SecondScreen extends StatefulWidget {
//  @override
//  _SecondScreenState createState() => _SecondScreenState();
//}
//
//class _SecondScreenState extends State<SecondScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(child: Text('I am second screen')),
//    );
//  }
//}