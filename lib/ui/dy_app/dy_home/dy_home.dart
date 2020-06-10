
//抖音首页
import 'package:flutter/material.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';

import 'recommed/dy_recommend.dart';

class DyHome extends StatefulWidget {
  final double width;
  final double height;

  DyHome(this.width, this.height, {Key key}) : super(key: key);

  @override
  _DyHomeState createState() => _DyHomeState();
}

class _DyHomeState extends State<DyHome>
    with SingleTickerProviderStateMixin {

  List tabs = ["关注", "推荐"];
  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(initialIndex: 1, length: tabs.length,vsync: this); //需要定义一个Controller
  }

  @override
  Widget build(BuildContext context) {
    //页面标签
    TabBar tabBar = TabBar(
      isScrollable: true,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,
          shadows: [Shadow(color: Colors.black,blurRadius: 0.5)]),
      controller: _tabController,
      tabs: tabs.map((e) => Tab(text: e)).toList(),
    );
    //页面
    TabBarView tabBarView = TabBarView(
      controller: _tabController,
      children: <Widget>[

        Image.network('http://cms-bucket.ws.126.net/2020/0501/b6fa999aj00q9mken0009c0009c005uc.jpg'),
//        Image.network('https://p1.pstatp.com/large/tos-cn-p-0015/86a5a7ee215e4b81b6751edbb02f7cc9_1588413349.jpg'),
        DyRecommend(Global.screenWidth, Global.screenHeight),
      ],
//      children: tabs.map((tab) {
//        return Container(
//          color: Colors.tealAccent,
//          child: Center(child: Text(tab,textScaleFactor: 5,)),
//        );
//      }).toList(),
    );

    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: <Widget>[
          tabBarView,
          Positioned(
            top: Global.statusBarHeight,
            child: Container(
              width: widget.width,
              height: 40,
//                color: Colors.redAccent,
              child: Center(
                child: tabBar,
              ),
            ),
          ),
        ],
      ),
    );
  }
}