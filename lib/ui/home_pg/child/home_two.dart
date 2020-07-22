
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/event/event_mgr.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/ui/home_pg/child/two_child/new_video/new_video.dart';
import 'package:myapp/ui/home_pg/child/two_child/two_video_controller.dart';


//视频
class HomeTwo extends StatefulWidget {
  final double height;
  final String title;
  HomeTwo(this.height, {Key key, this.title = "视频"}) : super(key: key);
  @override
  _HomeTwoState createState() => _HomeTwoState();
}

class _HomeTwoState extends State<HomeTwo>
with SingleTickerProviderStateMixin{// vsync

  List tabs = ["新闻视频", "抖音视频", "火山视频", "影院视频",];
  TabController _tabController;

  StreamSubscription<HomeChangeTabelEvent> _eventBus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogUtils.log("    ----  HomeTwo initState",type: 2);

    _eventBus = Global.eventBus.on<HomeChangeTabelEvent>().listen((event) {
      if (this.mounted == false) return;
      if (HomeTabelEnum.two.index == event.page){
        LogUtils.log("====切换至 HomeTwo===");
        changePage(_tabController.index);
      }
    });

    _tabController = TabController(length: tabs.length, initialIndex: 0, vsync: this)
    ..addListener((){
      if (this.mounted == false) return;
      if(_tabController.indexIsChanging == false)
        changePage(_tabController.index);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    LogUtils.log("    ----  HomeTwo dispose",type: 2);
    _tabController?.dispose();
    _eventBus?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //页面标签
    TabBar tabBar = TabBar(
      isScrollable: true,
      labelColor: Colors.red,
      unselectedLabelColor: Color(0xff666666),
      labelStyle: TextStyle(fontSize: 16.0),
      controller: _tabController,
      tabs: tabs.map((e) => Tab(text: e)).toList(),
//      onTap: (int index){
//        changePage(index);
//      },
    );
    //页面
    TabBarView tabBarView = TabBarView(

      controller: _tabController,
      children: <Widget>[
        NewVideo(widget.height - (Global.statusBarHeight + 40), title: tabs[0],),
//        DyVideo(widget.height - (Global.statusBarHeight + 40), title: tabs[1],),
        Container(
          color: Colors.tealAccent,
          child: Center(child: Text(tabs[1],textScaleFactor: 5,)),
        ),
        Container(
          color: Colors.tealAccent,
          child: Center(child: Text(tabs[2],textScaleFactor: 5,)),
        ),
        Container(
          color: Colors.tealAccent,
          child: Center(child: Text(tabs[3],textScaleFactor: 5,)),
        )
      ],
    );

    return Column(
      children: <Widget>[
        //顶部安全区
        Container(
//          color: Colors.redAccent,
          width: Global.screenWidth,
          height: Global.statusBarHeight,
        ),
        Container(
          height: 40,
          child: tabBar,
        ),
        Expanded(
          child:tabBarView
        ),
      ],
    );
  }

  //切换(滑动页面或点击标签)至哪个页面  -- index
  void changePage(int index){
    LogUtils.log("    ----  HomeTwo changePage  $index 页",type: 2);
    videoMgr.pause__();

    Global.eventBus.fire(TwoVideoChangeTabelEvent(index));

    //计算应该播放
    if(index == VideoPageTabelEnum.dy.index){
      Global.eventBus.fire(DYChangeIndexEvent(videoMgr.indexList[index]));
    }
  }
}