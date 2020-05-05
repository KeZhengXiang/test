
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/global/global.dart';


class TwoNewItem extends StatefulWidget {
  final int index;
  final double width;
  final double height;
  final String title;

  TwoNewItem(this.index,this.width,this.height,{Key key, this.title = "我"}) : super(key: key);

  @override
  _TwoNewItemState createState() => _TwoNewItemState();
}

class _TwoNewItemState extends State<TwoNewItem> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("    ----  TwoNewItem initState ${widget.index}");

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("TwoNewItem dispose ${widget.index}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //播放器
        Container(
          width: widget.width,
          height: widget.height - 40,
          color: Colors.redAccent,
          child: Stack(
            children: <Widget>[
              //封面
              CachedNetworkImage(
                width: widget.width,
                height: widget.height - 40,
                fit: BoxFit.fill,
                imageUrl: "http://cms-bucket.ws.126.net/2020/0501/ce55fb88p00q9n3ww002tc0009c005uc.png",
                placeholder: (context, url) => Image.asset("images/app.jpg"),
                errorWidget: (context, url, error) =>
                    Image.asset("images/app.jpg"),
              )
              //标题
            ],
          ),
        ),

        //下标头
        Container(
          width: widget.width,
          height: 40,
        ),
      ],
//      color: Col
    );
  }
}