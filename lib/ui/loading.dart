
import 'dart:async';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/http/Git.dart';
import 'package:myapp/ui/home_pg/custom_home.dart';
import 'package:myapp/ui/home_pg/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/global.dart';
import '../http/net_work.dart';

//启动页
class Loading extends StatefulWidget {

  Loading({Key key}): super(key : key);

  @override
  _LoadingState createState() => _LoadingState();

}

class _LoadingState extends State<Loading>{

  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


//    NetWork().getHttp();
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //第一个页面调用
    Global.uiInit(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: Global.screenWidth,
        height: Global.screenHeight,
        child: Stack(

          children: <Widget>[
            //背景图
            Positioned(
              left: 0,
              top: 0,
              child: GestureDetector(
                onTap: (){
                  //跳转广告链接
                  const String url = 'https://flutter.cn';
                  //1 浏览器跳转
                  _launchURL(url: url);

                },
                child:Image.asset("images/launch_background.jpeg",
                  fit: BoxFit.cover,
                ),
//                width: Global.screen_width,
              ),//back.jpg
            ),
//            CachedNetworkImage(
//              imageUrl: "http://cms-bucket.ws.126.net/2020/0421/62f1da67p00q94mpf00cyc000s600e3c.png",
//              placeholder: (context, url) => CircularProgressIndicator(),
//              errorWidget: (context, url, error) => Icon(Icons.error),
//            ),

            //倒计时
            Positioned(
              top: Global.statusBarHeight + 10,
              right: 15,
              child: RefreshStartUpWidget((int type){
                if (type == 0){
                  LogUtils.log("时间到，请点击跳转首页");
                }else if(type == 1){
                  LogUtils.log("被点击，执行启动跳转首页");
                  monitorInfoInit();
                }

              }),
            ),


          ],
        ),
      ),
    );
  }



  _launchURL({String url = 'https://flutter.cn'} ) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Future.error("Could not launch $url");
//      throw 'Could not launch $url';
    }
  }

  //监测
  void monitorInfoInit(){
    var recordTime = 0;
    if(!Global.isCompleteInfoInit){
      timer = Timer.periodic(Duration(milliseconds: 200), (Timer timer){
        // 监测至极限时间 放弃
        recordTime += 200;
        if(recordTime >= 5 * 1000){
          //报错弹窗
          timer.cancel();
          timer = null;
          LogUtils.log("监测初始化数据至极限时间 放弃");
          Future.error("监测初始化数据至极限时间 放弃");
          return;
        }

        if(Global.isCompleteInfoInit){
          timer.cancel();
          timer = null;
          goHome();
        }
      });

    }else{
      goHome();
    }
  }

  void goHome(){

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CustomHome();
    }));
  }
}

//------------------------
/// 倒计时刷新组建
class RefreshStartUpWidget extends StatefulWidget {

  final int microseconds;
  final double radius;
  final double width;
  final double height;
  //type 0-倒计时完成回调  1-点击回调
  final Function(int type) callback;

  RefreshStartUpWidget(this.callback,{Key key,
    this.microseconds = 3,
    this.width = 100,
    this.height = 40,
    this.radius = 20,}):super(key : key);

  @override
  _RefreshStartUpWidgetState createState() => _RefreshStartUpWidgetState();

}

class _RefreshStartUpWidgetState extends State<RefreshStartUpWidget> {

  Timer timer;
  int cur_icroseconds = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cur_icroseconds = widget.microseconds;
    if (cur_icroseconds >= 1){
      timer = Timer.periodic(Duration(milliseconds: 1000), (Timer timer){
        setState(() {
          cur_icroseconds-=1;
        });
        print(cur_icroseconds);
        if(cur_icroseconds <= 0){
          widget.callback(0);
          timer.cancel();
          timer = null;
        }
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

//    return ClipRRect(
//      borderRadius: BorderRadius.circular(widget.radius),
//      child: Container(
//        width: widget.width,
//        height: widget.height,
//        color: Color.fromARGB(0,0,0,0),
//        child: Center(
//          child: Text("$cur_icroseconds 秒",style: TextStyle(fontSize: 14,color: Colors.black),),
//        ),
//      ),
//    );
    String tip = (cur_icroseconds <= 0) ? "进入" : "广告 $cur_icroseconds 秒";
    return GestureDetector(
      onTap: (){
        widget.callback(1);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Text(tip, style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w500),),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF000000), width: 0.5), // 边色与边宽度
          color: Color(0x44666666), // 底色
          borderRadius: BorderRadius.circular((20.0)), // 圆角度
//          borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 50)),
        ), // 也可控件一边圆角大小
      ),
    );
  }
}

