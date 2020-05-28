
enum HomeTabelEnum {
  one,
  two,
  three,
  fuor,
}
class HomeChangeTabelEvent {
  final int page;
  HomeChangeTabelEvent(this.page);
}


enum ChangePageRefreshEnum {
  change,//只是切换
  refresh,//只是刷新
}
// tableView 切换页面事件
class TwoVideoChangeTabelEvent {
  int index;
  ChangePageRefreshEnum type;
  TwoVideoChangeTabelEvent(this.index,{this.type = ChangePageRefreshEnum.change});
}

enum VideoPageTabelEnum {
  xw,//新闻
  dy,//抖音
  hs,//火山
  yy,//影院
}

class DYChangeIndexEvent {
  int index;
  DYChangeIndexEvent(this.index);
}