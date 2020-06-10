import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/route_name.dart';
import 'package:myapp/test/constrained_box.dart';
import 'package:myapp/test/media/test_media.dart';
import 'package:myapp/test/test_easy_dialog.dart';
import 'package:myapp/test/test_flutter_custom_dailog.dart';
import 'package:myapp/test/test_main.dart';
import 'package:myapp/test/test_progress_dialog.dart';
import 'package:myapp/test/test_toast.dart';
import 'package:myapp/ui/dy_app/dy_main.dart';
import 'package:myapp/ui/home_pg/custom_home.dart';
import 'package:myapp/ui/loading.dart';
import 'package:myapp/ui/login_route.dart';

void main(){
//  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  Global.init();
  //修改状态栏颜色为白色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my-app',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//    themeMode: ThemeMode.dark,

      // 注册
      initialRoute: RouteName.Loading,
      routes: {
        RouteName.Loading: (context) => Loading(),
        RouteName.LoginRoute: (context) => LoginRoute(),
        RouteName.CustomHome: (context) => CustomHome(),

        RouteName.DyMain: (context) => DyMain(),


        //test
        RouteName.TestMain: (context) => TestMain(),
        RouteName.TestToast: (context) => TestToast(),
        RouteName.TestProgressDialog: (context) => TestProgressDialog(),
        RouteName.TestEasyDialog: (context) => TestEasyDialog(),
        RouteName.TestFlutterCustomDailog: (context) => TestFlutterCustomDailog(),
        RouteName.TestConstrainedBox: (context) => TestConstrainedBox(),
        RouteName.TestMedia: (context) => TestMedia(),

      },
      home: Loading(),
    );
  }
}