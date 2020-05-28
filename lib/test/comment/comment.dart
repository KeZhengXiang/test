

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:myapp/global/global.dart';


//构建评论弹窗
YYDialog GetCommentDialog({BuildContext context}) {
  return YYDialog().build(context)
    ..height = Global.screen_height * 0.7
    ..width = Global.screen_width
    ..gravity = Gravity.bottom
    ..gravityAnimationEnable = true
    ..borderRadius = 10.0
    ..widget(CommentDialog(Global.screen_width, Global.screen_height * 0.7))
    ..show();
}


//评论弹窗盒子
class CommentDialog extends StatefulWidget {
  final double width;
  final double height;
  CommentDialog(this.width, this.height,{Key key}) : super(key: key);

  @override
  _CommentDialogState createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.blue,
      ),
    );
  }
}