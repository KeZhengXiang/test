
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/global/global.dart';


//首页
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title = "首页"}) : super(key: key);

  final String title;
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = Container(
      color: Colors.lightBlueAccent,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: Text("左上"),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Text("右下"),
          ),
          Positioned(
            top: 40,
            left: 40,
            child: Container(
              width: Global.screen_width - 80,
              color: Colors.red,
            ),
          ),
//          FloatingActionButton(
//            onPressed: _incrementCounter,
//            tooltip: 'Increment',
//            child: Icon(Icons.add),
//          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: Container(
          width: Global.screen_width - 70,
          height: 40,
          child: Stack(
            children: <Widget>[
              //搜索条
              Positioned(
                child: Container(
                  width: Global.screen_width - 70,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0x44888888), // 底色
                    borderRadius: BorderRadius.circular((20.0)), // 圆角度
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,//水平居中
                    children: <Widget>[
                      Icon(Icons.search),
                      Text("五一劳动节"),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
      body: body,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business)),
            FlatButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: (){

              },
            ),
//            Column(
//              children: <Widget>[
//                Text("详情"),
//                Icon(Icons.info),
//              ],
//            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间

        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}