
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/global/global.dart';
import 'package:myapp/ui/home_pg/child/two_child/dy_video/dy_video.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("    ----  HomeTwo initState");

    _tabController = TabController(length: tabs.length,vsync: this); //需要定义一个Controller

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("    ----  HomeTwo dispose");
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
      onTap: (int index){
        print("点击标签 到 $index 页");
        TwoVideoController().pause__();
      },
    );
    //页面
    TabBarView tabBarView = TabBarView(
      controller: _tabController,
      children: <Widget>[
        NewVideo(widget.height - (Global.padding_top + 40), title: tabs[0],),
        DyVideo(widget.height - (Global.padding_top + 40), title: tabs[1],),
//        Container(
//          color: Colors.tealAccent,
//          child: Center(child: Text(tabs[1],textScaleFactor: 5,)),
//        ),
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
          width: Global.screen_width,
          height: Global.padding_top,
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
}