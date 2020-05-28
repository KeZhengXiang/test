
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/global/global.dart';
import 'package:myapp/ui/home_pg/child/two_child/two_video_controller.dart';
import 'package:video_player/video_player.dart';


class NewVideoItem extends StatefulWidget {
  final int index;
  final double width;
  final double height;
  final String title;
  final Function _pause;
  final Function _play;

  NewVideoItem(this.index,this.width,this.height, this._pause, this._play,{Key key, this.title = "我",}) : super(key: key);

  @override
  _NewVideoItemState createState() => _NewVideoItemState();
}

class _NewVideoItemState extends State<NewVideoItem> {
  String _url = "https://www.runoob.com/try/demo_source/mov_bbb.mp4";
  VideoPlayerController _controller;
  bool _videoError = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("    ----  TwoNewItem initState ${widget.index}");

    _controller = VideoPlayerController.network(this._url)..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        print("player initialize");

        setState(() {});
      });
    _controller.setLooping(true);
    videoMgr.add__(_controller);
//    _controller.addListener(_videoListener);
  }

  void _videoListener() async {
    if (!mounted) {
      return;
    }
//    VideoPlayerValue
    if (_controller.value.hasError) {
      setState(() {
        _videoError = true;
      });
    } else {
//      Duration res = await _controller.position;
//      if (res >= _controller.value.duration) {
//        await _controller.seekTo(Duration(seconds: 0));
//        await _controller.play();
//      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("TwoNewItem dispose ${widget.index}");


    videoMgr.remove__(_controller);
    _controller.removeListener(_videoListener);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("_controller ${_controller.value.size}");
    return Column(
      children: <Widget>[
        //播放器
        Container(
          width: widget.width,
          height: widget.height - 40,
          color: Colors.grey,
          child: Stack(
            children: <Widget>[
              // 播放器
              Container(
                width: widget.width,
                height: widget.height - 40,
                color: Colors.grey,
                child: Center(
                  child: _controller.value.initialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ): Container(),
                ),
              ),
              // 播放按钮
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? pause()
                          : play();
                    });
                  },
                child: Container(
                  width: widget.width,
                  height: widget.height - 40,
                  color: Color(0x0ffffff),
                  child: Center(
                    child:_controller.value.isPlaying ? Text("") : Icon(Icons.play_arrow),
                  ),
                ),
              ),
              //封面
//              CachedNetworkImage(
//                width: widget.width,
//                height: widget.height - 40,
//                fit: BoxFit.fill,
//                imageUrl: "http://cms-bucket.ws.126.net/2020/0501/ce55fb88p00q9n3ww002tc0009c005uc.png",
////                placeholder: (context, url) => Image.asset("images/app.jpg"),
////                errorWidget: (context, url, error) =>
////                    Image.asset("images/app.jpg"),
//              )
              //标题
            ],
          ),
        ),

        //下标头
        Container(
          width: widget.width,
          height: 40,
          color: Colors.black,
        ),
      ],
//      color: Col
    );


  }



  void pause(){
//    widget._pause();
    _controller.pause();
//    setState(() {
//
//    });
  }

  void play(){
    videoMgr.indexList[0] = widget.index;
    widget._play();
    _controller.play();
//    setState(() {
//
//    });
  }
}