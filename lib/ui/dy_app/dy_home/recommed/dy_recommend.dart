


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/models/dy_model/dy_json_path_config.dart';
import 'package:myapp/models/dy_model/dy_video_model.dart';

import 'video_layer/dy_video.dart';

// 推荐
class DyRecommend extends StatefulWidget {
  final double width;
  final double height;

  DyRecommend(this.width, this.height, {Key key}) : super(key: key);

  @override
  _DyRecommendState createState() => _DyRecommendState();
}

class _DyRecommendState extends State<DyRecommend> {

  List<DyVideoModel> videos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //get 视频列表数据
    DefaultAssetBundle.of(context).loadString(DyJsonPathCfg.videos_path).then((value) {
      var data = jsonDecode(value);
//      LogUtils.log("    ----  json:\n ${data}");
      var list = data["videos"] as List;
      for(int i = 0; i < list.length; i++){
        var model = DyVideoModel.fromJson(list[i]);
        videos.add(model);
      }
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 空数据显示
    var empty = Container(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: Text("数据拉取中..."),
      ),
    );

    //有数据常态显示
    var normal = Stack(
      children: <Widget>[
        //视频层
        Positioned(
          top: Global.statusBarHeight,
          child: DyVideo(videos, widget.width, widget.height - Global.statusBarHeight),
        ),
      ],
    );
    return Container(
      width: widget.width,
      height: widget.height,
      child: videos.isNotEmpty ? normal : empty,
    );
  }
}