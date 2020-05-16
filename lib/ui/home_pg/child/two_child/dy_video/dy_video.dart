//file: 抖音类型 视频页面


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:myapp/global/global.dart';
import 'package:myapp/ui/home_pg/child/two_child/new_video/new_video_item.dart';
import 'package:myapp/ui/home_pg/child/two_child/two_video_controller.dart';
import 'package:video_player/video_player.dart';

import 'dy_video_item.dart';


class DyVideo extends StatefulWidget {
  final double height;
  final String title;
  DyVideo(this.height,{Key key, this.title = "null"}) : super(key: key);

  @override
  _DyVideoState createState() => _DyVideoState();
}

class _DyVideoState extends State<DyVideo>
//    with AutomaticKeepAliveClientMixin
{
//  @override
//  bool get wantKeepAlive => true;
  var itemCount = 3;
  var initIndex = 0;

  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>["9999","9999","9999",loadingTag];
  var isRetrieve = false;//是否请求数据

  var tc = TwoVideoController();
  SwiperControl _swiperControl = SwiperControl(iconNext: null,iconPrevious: null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("two_new initState");

    itemCount = 3;
    initIndex = 0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("two_new dispose");

  }

  @override
  Widget build(BuildContext context) {
    //视频试图
    Swiper swiper = Swiper(
      itemBuilder: (BuildContext context,int index){
        print("create  index = $index");
        return DyVideoItem(index,Global.screen_width, widget.height,(){
          //pause
          tc.clist.forEach((element) {
            element.pause();
          });
        }, (){
          //play
          tc.clist.forEach((element) {
            element.pause();
          });
        });
      },
      index: initIndex,
      loop: false,
      scrollDirection: Axis.vertical,
      autoplay: false,

      itemCount: itemCount,
      control: _swiperControl,
      onIndexChanged: (int index){
        print("index $index");
        initIndex = index;
      },

      onTap: (int index){
        itemCount = 1000;
        print("--------------itemCount $itemCount");
        setState(() {

        });
      },
    );

    return Container(
      width: Global.screen_width,
      height: widget.height,
      child: Stack(
        children: <Widget>[
          //视频窗口
          swiper,

          //下方窗口

          //右侧窗口
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