
// 抖音视频作者信息
class DyVideoAuthorModel {
  int id;//用户id
  String name;//名字
  String avatar;//头像

  DyVideoAuthorModel({this.id, this.name, this.avatar});

  factory DyVideoAuthorModel.fromJson(Map<String, dynamic> json) {
    return DyVideoAuthorModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}