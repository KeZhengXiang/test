

import 'package:flutter/material.dart';
import 'package:myapp/common/log_utils.dart';


///“展开/折叠”列表
class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Entry> data = <Entry>[
      new Entry('Chapter A',0,
        <Entry>[
          new Entry('Section A0',1,
            <Entry>[
              new Entry('Item A0.1',2),
              new Entry('Item A0.2',2),
              new Entry('Item A0.3',2),
            ],
          ),
          new Entry('Section A1',1),
          new Entry('Section A2',1),
        ],
      ),
      new Entry('Chapter B',0,
        <Entry>[
          new Entry('Section B0',1),
          new Entry('Section B1',1),
        ],
      ),
      new Entry('Chapter C',0,
        <Entry>[
//          new Entry('Section C0',1),
          new Entry('Section C1',1),
          new Entry('Section C2',1,
            <Entry>[
              new Entry('Item C2.0',2),
              new Entry('Item C2.1',2),
              new Entry('Item C2.2',2),
              new Entry('Item C2.3',2),
            ],
          ),
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionTile'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => new EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title,this.type, [this.children = const <Entry>[]]);
  final String title;
  final int type;
  final List<Entry> children;

}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    double offSetX = (root.type * 15).toDouble();
    String str = "";
    for (var i = 0; i < root.type; ++i){
      str += "  ";
    }
    print("$str ${root.title}===${offSetX}");
    if (root.children.isEmpty){
//      return Container(
//        padding: EdgeInsets.only(left: offSetX),
//        child:  ExpansionTile(
//          initiallyExpanded: false,
////          trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
//          title: Text(root.title),
//          onExpansionChanged: (bl){
//            LogUtils.log("onExpansionChanged ${root.title}, bl = $bl");
//          },
//        ),
//      );
      return Container(
//        color: Colors.black12,
        padding: EdgeInsets.only(left: offSetX),
        child: ListTile(
          onTap: (){
            LogUtils.log("onTap ${root.title}");
          },
          trailing: const Icon(Icons.navigate_next),
          title: Text(root.title),
        ),
      );
    }

    return Container(
//      color: Colors.black12,
      padding: EdgeInsets.only(left: offSetX),
      /*
        title:闭合时显示的标题，这个部分经常使用Text Widget。
        subtitle:副标题
        leading:标题左侧图标，多是用来修饰，让界面显得美观。
        backgroundColor: 展开时的背景颜色，当然也是有过度动画的，效果非常好。
        children: 子元素，是一个数组，可以放入多个元素。
        trailing ： 右侧的箭头，你可以自行替换但是我觉的很少替换，因为谷歌已经表现的很完美了。
        initiallyExpanded: 初始状态是否展开，为true时，是展开，默认为false，是不展开。
      */
      child: ExpansionTile(
        key: new PageStorageKey<Entry>(root),
        initiallyExpanded: false,
//        leading: Icon(Icons.account_balance),//CircleAvatar(),
        title: Text(root.title),
//        backgroundColor: Colors.lightBlueAccent,
        onExpansionChanged: (bl){
          LogUtils.log("onExpansionChanged ${root.title}, bl = $bl");
        },
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}