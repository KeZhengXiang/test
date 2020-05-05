//file: 新闻类型 视频页面


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/global/global.dart';
import 'package:my_app/ui/home_pg/child/two_child/two_item.dart';
import 'package:video_player/video_player.dart';


class TwoNewVideo extends StatefulWidget {
  final double height;
  final String title;
  TwoNewVideo(this.height,{Key key, this.title = "null"}) : super(key: key);

  @override
  _TwoNewVideoState createState() => _TwoNewVideoState();
}

class _TwoNewVideoState extends State<TwoNewVideo> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>["9999",loadingTag];
  var isRetrieve = false;//是否请求数据


  VideoPlayerController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.network(
        'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788/e1ab85305285890781763144364/v.f10.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        print("player initialize");
        setState(() {});
      });
//    _controller.addListener(() {
//      if (!mounted) {
//        return;
//      }
//      setState(() {});
//    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: Global.screen_width,
          height: widget.height,
          color: Colors.amberAccent,
          child: Center(
            child: _controller.value.initialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ): Container(),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("_controller.value.isPlaying = ${_controller.value.isPlaying}");
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ],
    );
//    ListView listView = ListView.separated(
//      padding: EdgeInsets.all(0),
//      itemCount: _words.length,
//      itemBuilder: (context, index) {
//        //如果到了表尾
//        if (_words[index] == loadingTag) {
//          //不足100条，继续获取数据
//          if (_words.length - 1 < 10) {
//            //获取数据
//            _retrieveData();
//            //加载时显示loading
//            return Container(
//              padding: const EdgeInsets.all(16.0),
//              alignment: Alignment.center,
//              child: SizedBox(
//                  width: 24.0,
//                  height: 24.0,
//                  child: CircularProgressIndicator(strokeWidth: 2.0)
//              ),
//            );
//          } else {
//            //已经加载了100条数据，不再获取数据。
//            return Container(
//                alignment: Alignment.center,
//                padding: EdgeInsets.all(16.0),
//                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
//            );
//          }
//        }
//        //显示列表项
//        return TwoNewItem(index,Global.screen_width, 300);
//      },
//      separatorBuilder: (context, index) => Divider(height: .0),
//    );
//    return listView;
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