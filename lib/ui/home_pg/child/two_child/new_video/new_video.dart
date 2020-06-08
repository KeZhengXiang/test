//file: 新闻类型 视频页面


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/event/event_mgr.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/ui/home_pg/child/two_child/new_video/new_video_item.dart';
import 'package:myapp/ui/home_pg/child/two_child/two_video_controller.dart';


class NewVideo extends StatefulWidget {
  final double height;
  final String title;
  NewVideo(this.height,{Key key, this.title = "null"}) : super(key: key);

  @override
  _NewVideoState createState() => _NewVideoState();
}

class _NewVideoState extends State<NewVideo>
    with AutomaticKeepAliveClientMixin
{
  @override
  bool get wantKeepAlive => true;

  StreamSubscription<TwoVideoChangeTabelEvent> _eventBus;


  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>["9999","9999","9999",loadingTag];
  var isRetrieve = false;//是否请求数据

  ScrollController _scrollController = ScrollController(initialScrollOffset:  0.0, keepScrollOffset: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("two_new initState");

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

    print("two_new dispose");
    videoMgr.pause__();
    _eventBus?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.all(0),
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 10) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }
        //显示列表项  320 176
        return NewVideoItem(index,Global.screenWidth, ((176/320) * Global.screenWidth) + 40,(){
          //pause
          videoMgr.clist.forEach((element) {
            element.pause();
          });
          setState(() {

          });
        }, (){
          //play
          videoMgr.clist.forEach((element) {
            element.pause();
          });
          setState(() {

          });
        });
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
    return listView;
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