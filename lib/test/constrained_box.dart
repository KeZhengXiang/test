//

//ConstrainedBox 约束盒子测试
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestConstrainedBox extends StatefulWidget {
  final String title;
  TestConstrainedBox({Key key, this.title = "约束盒子测试"}) : super(key: key);

  @override
  _TestConstrainedBoxState createState() => _TestConstrainedBoxState();
}

class _TestConstrainedBoxState extends State<TestConstrainedBox> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
              border: Border.all()
          ),
          //利用UnconstrainedBox 消除之前限制
          child: UnconstrainedBox(
            // 对child进行约束，
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: 60,
                      minWidth: 60,
                      maxHeight: 250,
                      maxWidth: 250
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),

                    ),
                  )
              )
          ),

        ),
      ),
    );
  }
}