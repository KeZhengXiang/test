
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/event/event_mgr.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/models/dy_model/dy_video_model.dart';
import 'package:myapp/ui/home_pg/child/two_child/two_video_controller.dart';
import 'package:video_player/video_player.dart';

//视频层组件
class DyVideoItem extends StatefulWidget {
  final DyVideoModel model;
  final int index;
  final double width;
  final double height;
  final String title;
  final Function _pause;
  final Function _play;

  DyVideoItem(this.model, this.index,this.width,this.height, this._pause, this._play,{Key key, this.title = "我",}) : super(key: key);

  @override
  _DyVideoItemState createState() => _DyVideoItemState();
}

class _DyVideoItemState extends State<DyVideoItem> {

  String _url = "https://www.runoob.com/try/demo_source/mov_bbb.mp4";

  StreamSubscription<DYChangeIndexEvent> _eventBus;
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogUtils.log("    ----  DyVideoItem initState ${widget.index}");

    _url = widget.model.url;

    _eventBus = Global.eventBus.on<DYChangeIndexEvent>().listen((event) {
      // All events are of type UserLoggedInEvent (or subtypes of it).
      if (widget.index != event.index) return;
      LogUtils.log("=======================event.curIndex = ${event.index}",type: 2);
      videoMgr.pause__();
      setState(() {});
      _controller.play();
    });

    _controller = VideoPlayerController.network(this._url)..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      LogUtils.log("player initialize");

//      videoMgr.pause__();
      if(widget.index == 0){
        _controller.play();
      }

      setState(() {});
    });
    _controller.setLooping(true);
    videoMgr.add__(_controller);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    LogUtils.log("DyVideoItem dispose ${widget.index}",type: 1);

    _eventBus?.cancel();

    videoMgr.remove__(_controller);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LogUtils.log("DyVideoItem build ${widget.index}",type: 2);
    var tansparentColor = Color(0x0);
    return Stack(
      children: <Widget>[
        // 播放器
        Container(
          width: widget.width,
          height: widget.height,
          color: tansparentColor,
          child: Center(
            child: _controller.value.initialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ): Container(),
          ),
        ),

        //封面
        Offstage(
          offstage: _controller.value.initialized,//隐藏条件
          child: CachedNetworkImage(
            width: widget.width,
            height: widget.height,
            fit: BoxFit.contain,
            imageUrl: widget.model.cover,
//                placeholder: (context, url) => Image.asset("images/app.jpg"),
//                errorWidget: (context, url, error) =>
//                    Image.asset("images/app.jpg"),
          ),
        ),

        // 播放控制
        GestureDetector(
          onTap: () {
            setState(() {
              _controller.value.isPlaying ? pause() : play();
            });
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            color: Color(0x0ffffff),
            child: Center(
              child: _controller.value.isPlaying ? Text("") : Icon(Icons.play_arrow),
            ),
          ),
        ),
      ],
    );

  }

  //

  void pause(){
    widget._pause();
    _controller.pause();
  }

  void play(){
    widget._play();
    _controller.play();
  }
}