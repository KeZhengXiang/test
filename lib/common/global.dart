

// 公共类
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common//global_function.dart';
import 'package:myapp/common//log_utils.dart';
import 'package:myapp/http/Git.dart';
import 'package:myapp/http/net_cache_obj.dart';
import 'package:myapp/http/net_work.dart';
import 'package:myapp/models/cacheConfig.dart';
import 'package:myapp/models/profile.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
//  Global._();
//  static Global _instance = Global._();
//  factory Global() {
//    return _instance;
//  }

  static const int defaultWidth = 1080;
  static const int defaultHeight = 1920;
  static double screenWidth = 0;/// 当前设备宽度 dp
  static double screenHeight = 0;/// 当前设备高度 dp
  static double statusBarHeight = 0;/// 状态栏高度 dp 刘海屏会更高
  static double bottomBarHeight = 0;  /// 底部安全区距离 dp

  // 是否完成数据初始设置
  static bool isCompleteInfoInit = false;
  // 是否完成UI初始设置
  static bool isTransferUiInit = false;


  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  // 当前平台
  static TargetPlatform targetPlatform;
  //App包信息
  static PackageInfo packageInfo;


  // 事件插件
  static EventBus eventBus = EventBus();
  // 本地数据存储
  static SharedPreferences _sharedPreferences;


  // 用户全部信息
  static Profile profile = Profile();
  // 网络缓存对象
  static NetCache netCache = NetCache();


  //初始化全局信息，会在APP启动时执行
  static Future init() async {

    //重写异常捕获(待研究)
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (isRelease) {
        Zone.current.handleUncaughtError(details.exception, details.stack);
      } else {
        FlutterError.dumpErrorToConsole(details);//反应到控制台
      }
    };

    //检测本地用户信息
    _sharedPreferences = await SharedPreferences.getInstance();
    LogUtils.log("检测本地用户信息");
    var _profile = _sharedPreferences.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }

    // 如果没有缓存策略，设置默认缓存策略
    LogUtils.log("设置缓存策略");
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    //初始化网络请求相关配置
    LogUtils.log("初始化网络请求相关配置");
    Git.init();

//    NetWork().getHttp();

    isCompleteInfoInit = true;
  }

  // 持久化Profile信息
  static saveProfile(){
    _sharedPreferences.setString("profile", jsonEncode(profile.toJson()));
  }


  //初始化界面数据
  static void uiInit(BuildContext context){
    if(isTransferUiInit) return;
    isTransferUiInit = true;

    LogUtils.log("============================flutter=================================");
    LogUtils.log("是否为release版: $isRelease");

    getPackageInfo();

    targetPlatform = Theme.of(context).platform;
    LogUtils.log("当前平台: $targetPlatform");
    if (Platform.isIOS){
      //调用IOS原生数据
      GlobalFunction.getBatteryLevel().then((value) => LogUtils.log("iOS设备电量：$value%"));
      GlobalFunction.getSystemName().then((value) => LogUtils.log("systeam name：$value"));
    }else if(Platform.isAndroid){

    }


    //UI配置
    ScreenUtil.init(context, width: defaultWidth, height: defaultHeight, allowFontScaling: true);
    screenWidth = ScreenUtil.screenWidthDp;
    screenHeight = ScreenUtil.screenHeightDp;
    statusBarHeight = ScreenUtil.statusBarHeight;
    bottomBarHeight = ScreenUtil.bottomBarHeight;

    LogUtils.log("\n "
        "设备像素密度；${ScreenUtil.pixelRatio} \n "
        "设备宽度；$screenWidth \n "
        "设备高度；$screenHeight \n "
        "状态栏高度；$statusBarHeight \n "
        "底部安全区距离；$bottomBarHeight");


  }

  static void getPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    LogUtils.log("--------包信息：\n "
        "APP名称: ${packageInfo.appName}\n "
        "包名: ${packageInfo.packageName} \n "
        "版本名: ${packageInfo.version} \n "
        "版本号: ${packageInfo.buildNumber}");
  }

}
