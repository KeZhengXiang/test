
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/global/global.dart';
import 'package:myapp/ui/home_pg/child/two_child/two_video_controller.dart';
import 'package:video_player/video_player.dart';


class DyVideoItem extends StatefulWidget {
  final int index;
  final double width;
  final double height;
  final String title;
  final Function _pause;
  final Function _play;

  DyVideoItem(this.index,this.width,this.height, this._pause, this._play,{Key key, this.title = "我",}) : super(key: key);

  @override
  _DyVideoItemState createState() => _DyVideoItemState();
}

class _DyVideoItemState extends State<DyVideoItem> {
  String _url = "https://www.runoob.com/try/demo_source/mov_bbb.mp4";
//  String _url = "http://flv.bn.netease.com/videolib3/1611/02/ECURs3951/SD/ECURs3951-mobile.mp4";


  VideoPlayerController _controller;
  bool _videoError = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("    ----  DyVideoItem initState ${widget.index}");

    _controller = VideoPlayerController.network(this._url)..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      print("player initialize");

//      TwoVideoController().pause__();
      _controller.play();
      setState(() {});
    });
    _controller.setLooping(true);
    TwoVideoController().add__(_controller);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("DyVideoItem dispose ${widget.index}");


    TwoVideoController().remove__(_controller);
    _controller.dispose();
  }

  void pause(){
    _controller.pause();
  }

  void play(){
    widget._play();
    _controller.play();
  }



  @override
  Widget build(BuildContext context) {
    print("DyVideoItem build ${widget.index}");
    return Column(
      children: <Widget>[
        //播放器
        Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey,
          child: Stack(
            children: <Widget>[
              // 播放器
              Container(
                width: widget.width,
                height: widget.height,
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
              Container(
                width: widget.width,
                height: widget.height,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      print("_controller.value.isPlaying = ${_controller.value.isPlaying}");
                      setState(() {
                        _controller.value.isPlaying
                            ? pause()
                            : play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                ),
              ),
              //封面
//              CachedNetworkImage(
//                width: widget.width,
//                height: widget.height,
//                fit: BoxFit.contain,
//                imageUrl: "http://cms-bucket.ws.126.net/2020/0501/ce55fb88p00q9n3ww002tc0009c005uc.png",
////                placeholder: (context, url) => Image.asset("images/app.jpg"),
////                errorWidget: (context, url, error) =>
////                    Image.asset("images/app.jpg"),
//              )
              //标题
            ],
          ),
        ),
      ],
//      color: Col
    );


  }
}