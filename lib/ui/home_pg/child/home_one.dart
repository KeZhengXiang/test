
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/global/global.dart';


//首页-one
class HomeOne extends StatefulWidget {
  final double height;
  final String title;
  HomeOne(this.height, {Key key, this.title = "首页"}) : super(key: key);

  @override
  _HomeOneState createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne>
    with SingleTickerProviderStateMixin {

  List tabs = ["新闻", "历史", "图片", "图片", "图片", "图片", "图片2", "图片", "图片", "图片4", "图片6"];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: tabs.length,vsync: this); //需要定义一个Controller

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
    );
    //页面
    TabBarView tabBarView = TabBarView(
      controller: _tabController,
      children: tabs.map((tab) {
        return Container(
          color: Colors.tealAccent,
          child: Center(child: Text(tab,textScaleFactor: 5,)),
        );
      }).toList(),
    );

    return Container(
      width: Global.screen_width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          //顶部安全区
          Container(
            color: Colors.redAccent,
            width: Global.screen_width,
            height: Global.padding_top,
          ),

          //搜索区
          Container(
            color: Colors.redAccent,
            width: Global.screen_width,
            height: 45,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //网易
                  GestureDetector(
                    child: Container(
                      child: Center(
                        child: Text("网易",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      width: 70,
                      height: 40,
                    ),
                    onTap: (){

                    },
                  ),
                  //搜索区
                  Stack(
                    children: <Widget>[
                      //搜索条
                      Positioned(
                        child: Container(
                            width: Global.screen_width - 140,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0x44888888), // 底色
                              borderRadius: BorderRadius.circular((20.0)), // 圆角度
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,//水平居中
                              children: <Widget>[
                                Icon(Icons.search,color: Colors.white,),
                                Text("五一劳动节",style:TextStyle(color: Colors.white)),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                  //热点
                  GestureDetector(
                    child: Container(
                      child: Center(
                        child: Text("热点",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      width: 70,
                      height: 40,
                    ),
                    onTap: (){
                    },
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 40,
            child: tabBar,
          ),

          Expanded(
            child: tabBarView,
          ),
        ],
      ),
    );
  }
}