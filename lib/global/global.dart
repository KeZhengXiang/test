

// 公共类
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/global/log_utils.dart';

class Global {

  static double screen_width = 0;
  static double screen_height = 0;

  static double padding_top = 0;
  static double padding_bottom = 0;



  //初始化界面数据
  static void init(BuildContext context){

//    final size = MediaQuery.of(context).size;
//    screen_width = size.width;
//    screen_height =size.height;
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    screen_width = mediaQuery.size.width;
    screen_height = mediaQuery.size.height;
    padding_top = mediaQuery.padding.top;
    padding_bottom = mediaQuery.padding.bottom;

    LogUtils.log("screen_width；$screen_width");
    LogUtils.log("screen_height；$screen_height");
    LogUtils.log("padding_top；$padding_top");
    LogUtils.log("padding_bottom；$padding_bottom");

    //默认 width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);

    //假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, width: 750, height: 1334);

    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

  }

}


class Screen {
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  static double get scale {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.devicePixelRatio;
  }

  static double get textScaleFactor {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.textScaleFactor;
  }

  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }
}

