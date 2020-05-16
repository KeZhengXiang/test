//file: 新闻类型 视频页面


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/global/global.dart';
import 'package:myapp/ui/home_pg/child/two_child/new_video/new_video_item.dart';
import 'package:myapp/ui/home_pg/child/two_child/two_video_controller.dart';
import 'package:video_player/video_player.dart';


class NewVideo extends StatefulWidget {
  final double height;
  final String title;
  NewVideo(this.height,{Key key, this.title = "null"}) : super(key: key);

  @override
  _NewVideoState createState() => _NewVideoState();
}

class _NewVideoState extends State<NewVideo>
//    with AutomaticKeepAliveClientMixin
{
//  @override
//  bool get wantKeepAlive => true;


  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>["9999","9999","9999",loadingTag];
  var isRetrieve = false;//是否请求数据

  var tc = TwoVideoController();


  //https://book.flutterchina.club/chapter6/scroll_controller.html
  ScrollController _scrollController = ScrollController(initialScrollOffset:  0.0, keepScrollOffset: true);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("two_new initState");

//    _scrollController.addListener(() {
//      print("_scrollController.offset ${_scrollController.offset}");
//    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("two_new dispose");
  }

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.all(0),
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 10) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }
        //显示列表项  320 176
        return NewVideoItem(index,Global.screen_width, ((176/320) * Global.screen_width) + 40,(){
          //pause
          tc.clist.forEach((element) {
            element.pause();
          });
          setState(() {

          });
        }, (){
          //play
          tc.clist.forEach((element) {
            element.pause();
          });
          setState(() {

          });
        });
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
    return listView;
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(_words.length - 1, ["9999"]);
      });
    });
  }
}