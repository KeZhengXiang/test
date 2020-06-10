
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/ui/dy_app/dy_home/dy_home.dart';

import 'dy_config.dart';



//抖音主页
class DyMain extends StatefulWidget {

  DyMain({Key key}) : super(key: key);

  @override
  _DyMainState createState() => _DyMainState();
}

class _DyMainState extends State<DyMain> {

  PageController controller = PageController(
      initialPage: 0,
      keepPage: true, //是否保存页面状态
      viewportFraction: 1);//页面占据视口比例

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //底部标签区  height
    final double bottomHeight = 40;
    //显示区  height
    final double bodyHeight = Global.screenHeight;
    

    PageView pageView = PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),//禁止滑动
      reverse: false,//默认false 禁用反向滑动
      pageSnapping: true,// 默认开启页面捕捉  false 禁用
//      onPageChanged: (int index){
//      },
      children: <Widget>[
        DyHome(Global.screenWidth, bodyHeight),
//        Image.network('https://p1.pstatp.com/large/tos-cn-p-0015/86a5a7ee215e4b81b6751edbb02f7cc9_1588413349.jpg'),
        Image.network('http://cms-bucket.ws.126.net/2020/0501/b6fa999aj00q9mken0009c0009c005uc.jpg'),
        Image.network('http://cms-bucket.ws.126.net/2020/0501/ce55fb88p00q9n3ww002tc0009c005uc.png'),
        Image.network('http://cms-bucket.ws.126.net/2020/0501/5a5eec9dp00q9mlgy0047c0009c005uc.png'),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: Global.screenWidth,
        height: Global.screenHeight,

        child: Stack(
          children: <Widget>[
            //显示区
            Positioned(
              top: 0,
              child: Container(
                width: Global.screenWidth,
                height: bodyHeight,
                child: pageView,
              ),
            ),

            //底部菜单区
            Positioned(
              bottom: Global.bottomBarHeight,
              child: BottomNavigationWidget(Global.screenWidth, bottomHeight, pageChange),
            ),

            //底部安全区
            Positioned(
              bottom: 0,
              child: Offstage(
                offstage: Global.bottomBarHeight <= 0,//隐藏条件
                child: Container(
                  width: Global.screenWidth,
                  height: Global.bottomBarHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void pageChange(int index){
    LogUtils.log("主页底部导航索引: $index ");
    if(index == 100){
      //
    }else{
      controller.jumpToPage(index);
//    videoMgr.pause__();
//    Global.eventBus.fire(HomeChangeTabelEvent(index));
    }
  }
}



//------------------------
/// App主页底部导航栏
class BottomNavigationWidget extends StatefulWidget {

  final themeColor = Color(0x0);
  final double width;
  final double height;
  final Function(int index) callback;//点击回调

  BottomNavigationWidget(this.width, this.height, this.callback,{Key key}):super(key : key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();

}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  var tabs = ["首页", "同城", "add", "消息", "我"];
  int index = 0;// 选中索引

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < tabs.length; ++ i){
      list.add(Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: (){
            onTap(i);
          },
          child: getCustomTabBarItem(tabs[i], i, index),
        ),
      ));
    }
    return Container(
      width: widget.width,
      height: widget.height,
      child: Flex(
        direction: Axis.horizontal,
        children: list,
      ),
    );
  }

  /// 按钮组件
  Widget getCustomTabBarItem(String title, int index, int selectIndex) {
    Color color;
    if(index != 2){
      color = (index == selectIndex ? Colors.white : Colors.grey);
    }
    return Container(
      width: 50,
      height: widget.height,
      color: widget.themeColor,
      child: Center(
        child: (index == 2)
            ? Icon(Icons.add, size: 35, color: Colors.grey,)
            : Text(title, style: TextStyle(color: color, fontSize: 18,
            fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black,blurRadius: 0.5)]),),
      ),
    );
  }

  void onTap(int _index){
    if(_index == 2){
      widget.callback(100);
    }else{
      setState(() {
        index = _index;
      });

      //换算页面索引
      var idx = _index;
      if(idx > 2) idx -= 1;
      widget.callback(idx);
    }
  }


}