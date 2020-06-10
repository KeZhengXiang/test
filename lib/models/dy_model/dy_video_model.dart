
// 抖音视频信息
import 'package:myapp/models/dy_model/dy_video_author_model.dart';

class DyVideoModel {
    int id;//视频id
    String url;//视频地址
    String cover;//视频封面
//    List<String> tags;//标签
//    DyVideoAuthorModel author;//作者
    String title;//标题
    String city;//城市

    int likeNum;//点赞数
    int commentNum;//评论数
    int shareNum;//分享数

    DyVideoModel({this.id, this.url, this.cover/*, this.tags*//*, this.author*/, this.title, this.city, this.likeNum, this.commentNum, this.shareNum});

    factory DyVideoModel.fromJson(Map<String, dynamic> json) {
        return DyVideoModel(
            id: json['id'],
            url: json['url'],
            cover: json['cover'],
//            tags: json['tags'],
//            author: DyVideoAuthorModel.fromJson(json['author']),
            title: json['title'],
            city: json['city'],
            likeNum: json['likeNum'],
            commentNum: json['commentNum'],
            shareNum: json['shareNum'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['url'] = this.url;
        data['cover'] = this.cover;
//        data['tags'] = this.tags;
        data['id'] = this.id;
//        data['author'] = this.author.toJson();
        data['title'] = this.title;
        data['c1ity'] = this.city;
        data['likeNum'] = this.likeNum;
        data['commentNum'] = this.commentNum;
        data['shareNum'] = this.shareNum;
        return data;
    }
}