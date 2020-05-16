
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/global/global.dart';
import 'package:myapp/ui/home_pg/child/home_one.dart';
import 'package:myapp/ui/home_pg/child/home_two.dart';

import 'child/two_child/two_video_controller.dart';



//首页（自定义）
class CustomHome extends StatefulWidget {

  CustomHome({Key key}) : super(key: key);

  @override
  _CustomHomeState createState() => _CustomHomeState();
}

class _CustomHomeState extends State<CustomHome> {

  PageController controller = PageController(
      initialPage: 0,
      keepPage: true, //是否保存页面状态
      viewportFraction: 1);//页面占据视口比例

  @override
  Widget build(BuildContext context) {
    //底部标签区  height
    final double bottom_height = 50;
    //显示区  height
    final double body_height = Global.screen_height - (bottom_height + Global.padding_bottom);
    PageView pageView = PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),//禁止滑动
      reverse: false,//默认false 禁用反向滑动
      pageSnapping: true,// 默认开启页面捕捉  false 禁用
      onPageChanged: (int index){
        print("home到 $index 页");
        TwoVideoController().pause__();
      },
      children: <Widget>[
        HomeOne(body_height),
        HomeTwo(body_height),
//        Image.network('http://cms-bucket.ws.126.net/2020/0501/ce55fb88p00q9n3ww002tc0009c005uc.png'),
        Image.network('http://cms-bucket.ws.126.net/2020/0501/b6fa999aj00q9mken0009c0009c005uc.jpg'),
//        Image.network('http://cms-bucket.ws.126.net/2020/0501/7c6943e4p00q9mogm002vc0009c005uc.png'),
        Image.network('http://cms-bucket.ws.126.net/2020/0501/5a5eec9dp00q9mlgy0047c0009c005uc.png'),
      ],
    );


    return Scaffold(
      body: Container(
        color: Colors.white,
        width: Global.screen_width,
        height: Global.screen_height,
        child: Stack(
          children: <Widget>[
            //显示区
            Positioned(
              top: 0,
              child: Container(
                width: Global.screen_width,
                height: Global.screen_height - (Global.padding_bottom + bottom_height),
                child: Center(
//                  child: Text("body"),
                  child: pageView,
                ),
              ),
            ),

            //底部菜单区
            Positioned(
              bottom: Global.padding_bottom,
              child: Container(
                width: Global.screen_width,
                height: bottom_height,
                color: Colors.red,
                child: CustomTabBarItem(bottom_height,(int index){
                  controller.jumpToPage(index);
                }),
              ),
            ),

            //底部安全区
            Positioned(
              bottom: 0,
              child: Offstage(
                offstage: Global.padding_bottom <= 0,//隐藏条件
                child: Container(
                  width: Global.screen_width,
                  height: Global.padding_bottom,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//------------------------
/// 自定义列表按钮
class CustomTabBarItem extends StatefulWidget {

  final double height;
  //点击回调
  final Function(int index) callback;

  CustomTabBarController controller;

  CustomTabBarItem(this.height, this.callback,{Key key}):super(key : key);

  @override
  _CustomTabBarItemState createState() => _CustomTabBarItemState();

}

class _CustomTabBarItemState extends State<CustomTabBarItem> {

  List tabs = ["首页", "视频", "圈子", "我"];
  // 选中索引
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 4; ++ i){
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
    return Flex(
      direction: Axis.horizontal,
      children: list,
    );
  }

  /// 按钮组件
  Widget getCustomTabBarItem(String title, int index, int selectIndex) {
    final Color color = (index == selectIndex ? Colors.black : Colors.white);
    return Container(
      width: 50,
      height: widget.height,
//      color: Colors.lightBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,//水平
        mainAxisAlignment: MainAxisAlignment.center,//垂直
        children: <Widget>[
          Icon(Icons.account_balance, color: color),
          Text(title, style: TextStyle(color: color),),
        ],
      ),
    );
  }

  void onTap(int _index){
    print(_index);
    setState(() {
      index = _index;
    });
    widget.callback(index);
  }
}

class CustomTabBarController {


}