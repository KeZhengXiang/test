//file: 抖音类型 视频页面


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:myapp/event/event_mgr.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/models/dy_model/dy_video_model.dart';
import 'package:myapp/ui/home_pg/child/two_child/two_video_controller.dart';

import 'dy_video_item.dart';


class DyVideo extends StatefulWidget {
  final List<DyVideoModel> videos;
  final double width;
  final double height;
  final String title;
  DyVideo(this.videos, this.width,this.height,{Key key, this.title = "null"}) : super(key: key);

  @override
  _DyVideoState createState() => _DyVideoState();
}

class _DyVideoState extends State<DyVideo>
    with AutomaticKeepAliveClientMixin
{
  @override
  bool get wantKeepAlive => true;

  StreamSubscription<TwoVideoChangeTabelEvent> _eventBus;

  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>["9999","9999","9999",loadingTag];
  var isRetrieve = false;//是否请求数据

  SwiperControl _swiperControl = SwiperControl(iconNext: null,iconPrevious: null);

  int itemCount = 100;
  int playIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogUtils.log("dy_video initState");

    itemCount = 100;
    playIndex = 0;

    _eventBus = Global.eventBus.on<TwoVideoChangeTabelEvent>().listen((event) {
      if (ChangePageRefreshEnum.refresh == event.type){
        LogUtils.log("====重新拉取数据刷新===",type: 2);
      }else{
        LogUtils.log("====重新渲染===",type: 2);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    LogUtils.log("dy_video dispose");
    _eventBus?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //视频试图
    Swiper swiper = Swiper(
      itemBuilder: (BuildContext context,int index){
        LogUtils.log("create  index = $index");
        return DyVideoItem(widget.videos[index], index, widget.width, widget.height,(){
          //pause
          videoMgr.clist.forEach((element) {
            element.pause();
          });
        }, (){
          //play
          videoMgr.clist.forEach((element) {
            element.pause();
          });
        });
      },
      index: playIndex,
      loop: false,
      scrollDirection: Axis.vertical,
      autoplay: false,

      itemCount: widget.videos.length,
      control: _swiperControl,
      onIndexChanged: (int index){
        Global.eventBus.fire(DYChangeIndexEvent(index));
        playIndex = index;
        videoMgr.indexList[1] = index;
      },
    );

    return Container(
      width: Global.screenWidth,
      height: widget.height,
      color: Color(0x0),
      child: Stack(
        children: <Widget>[
          //视频列表
          swiper
        ],
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(_words.length - 1, ["9999"]);
      });
    });
  }
}