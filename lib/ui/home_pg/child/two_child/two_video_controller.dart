

import 'package:video_player/video_player.dart';

class TwoVideoController {
  static final TwoVideoController _singleton = new TwoVideoController._internal();

  factory TwoVideoController() {
    return _singleton;
  }
  TwoVideoController._internal();
  //==========================

  List<VideoPlayerController> clist = [];

  void add__(VideoPlayerController _controller){
    if(clist == null) clist = [];
    clist.add(_controller);
  }
  void remove__(VideoPlayerController _controller){
    if(clist == null || clist.isEmpty ) return;
    clist.remove(_controller);
  }

  void pause__(){
    if(clist == null || clist.isEmpty ) return;
    clist.forEach((element) {
      element.pause();
    });
  }

  void clear__(){
    if(clist == null || clist.isEmpty ) return;
    clist.forEach((element) {element?.dispose();});
    clist = [];
  }




}