import 'package:flutter/material.dart';

class RouteName {

  //启动页
  static const String Loading = "Loading";

  //登录
  static const String LoginRoute = "LoginRoute";
  //主页
  static const String CustomHome = "CustomHome";


  //主页
  static const String DyMain = "DyMain";


  //----test
  //测试主页
  static const String TestMain = "TestMain";

  ///https://pub.dev
  //pub: fluttertoast
  static const String TestToast = "TestToast";
  //pub: progress_dialog
  static const String TestProgressDialog = "TestProgressDialog";
  //pub: easy_dialog
  static const String TestEasyDialog = "TestEasyDialog";
  //flutter_custom_dialog
  static const String TestFlutterCustomDailog = "TestFlutterCustomDailog";
  //ConstrainedBox 约束盒子测试
  static const String TestConstrainedBox = "TestConstrainedBox";
  //媒体（打开照片库、拍摄照片、打开视频库、拍摄视频） image_picker
  static const String TestMedia = "TestMedia";





}


class CustomRoute extends PageRouteBuilder{
  final Widget widget;

  CustomRoute(this.widget)
      :super(
    // 设置过度时间
      transitionDuration:Duration(seconds: 1),
      // 构造器
      pageBuilder:(
          // 上下文和动画
          BuildContext context,
          Animation<double> animaton1,
          Animation<double> animaton2,
          ){
        return widget;
      },
      transitionsBuilder:(
          BuildContext context,
          Animation<double> animaton1,
          Animation<double> animaton2,
          Widget child,
          ){

        // 需要什么效果把注释打开就行了
        // 渐变效果
        return FadeTransition(
          // 从0开始到1
          opacity: Tween(begin: 0.0,end: 1.0)
              .animate(CurvedAnimation(
            // 传入设置的动画
            parent: animaton1,
            // 设置效果，快进漫出   这里有很多内置的效果
            curve: Curves.fastOutSlowIn,
          )),
          child: child,
        );

        // 缩放动画效果
        // return ScaleTransition(
        //   scale: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
        //     parent: animaton1,
        //     curve: Curves.fastOutSlowIn
        //   )),
        //   child: child,
        // );

        // 旋转加缩放动画效果
        // return RotationTransition(
        //   turns: Tween(begin: 0.0,end: 1.0)
        //   .animate(CurvedAnimation(
        //     parent: animaton1,
        //     curve: Curves.fastOutSlowIn,
        //   )),
        //   child: ScaleTransition(
        //     scale: Tween(begin: 0.0,end: 1.0)
        //     .animate(CurvedAnimation(
        //       parent: animaton1,
        //       curve: Curves.fastOutSlowIn
        //     )),
        //     child: child,
        //   ),
        // );

        // 左右滑动动画效果
        // return SlideTransition(
        //   position: Tween<Offset>(
        //     // 设置滑动的 X , Y 轴
        //     begin: Offset(-1.0, 0.0),
        //     end: Offset(0.0,0.0)
        //   ).animate(CurvedAnimation(
        //     parent: animaton1,
        //     curve: Curves.fastOutSlowIn
        //   )),
        //   child: child,
        // );
      }
  );
}