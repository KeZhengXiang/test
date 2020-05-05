
//头条数据模型  T1348647853363

class HeadLineModel {
  String sourceId;
  String template;
  String lmodify;
  String source;
  String postid;

  String title;
  String mtime;
  int hasImg;
  String topic_background;
  String digest;

  String boardid;
  String alias;
  int hasAD;
  String imgsrc;
  String ptime;

  String daynum;
  int hasHead;
  int order;
  int votecount;
  bool hasCover;

  String docid;
  String tname;
  String url_3w;
  int priority;
  String url;

  int quality;
  int commentStatus;
  String ename;
  int replyCount;
  String ltitle;

  bool hasIcon;
  String subtitle;
  String cid;
  List<AdsModel> ads;

  HeadLineModel();

  HeadLineModel.fromJson(Map<String, dynamic> json)
      : sourceId = json['sourceId'],
        template = json['template'],
        lmodify = json['lmodify'],
        source = json['source'],
        postid = json['postid'],

        title = json['title'],
        mtime = json['mtime'],
        hasImg = json['hasImg'],
        topic_background = json['topic_background'],
        digest = json['digest'],

        boardid = json['boardid'],
        alias = json['alias'],
        hasAD = json['hasAD'],
        imgsrc = json['imgsrc'],
        ptime = json['ptime'],

        daynum = json['daynum'],
        hasHead = json['hasHead'],
        order = json['order'],
        votecount = json['votecount'],
        hasCover = json['hasCover'],

        docid = json['docid'],
        tname = json['tname'],
        url_3w = json['url_3w'],
        priority = json['priority'],
        url = json['url'],

        quality = json['quality'],
        commentStatus = json['commentStatus'],
        ename = json['ename'],
        replyCount = json['replyCount'],
        ltitle = json['ltitle'],

        hasIcon = json['hasIcon'],
        subtitle = json['subtitle'],
        cid = json['cid']
  {
    ads = [];
    if (json['ads'] != null && (json['ads'] as List).length > 0){
      (json['ads'] as List).forEach((val) => ads.add(AdsModel.fromJson(val)));
    }

  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'sourceId': sourceId,
        'template': template,
        'lmodify': lmodify,
        'source': source,
        'postid': postid,

        'title': title,
        'mtime': mtime,
        'hasImg': hasImg,
        'topic_background': topic_background,
        'digest': digest,

        'boardid': boardid,
        'alias': alias,
        'hasAD': hasAD,
        'imgsrc': imgsrc,
        'ptime': ptime,

        'daynum': daynum,
        'hasHead': hasHead,
        'order': order,
        'votecount': votecount,
        'hasCover': hasCover,

        'docid': docid,
        'tname': tname,
        'url_3w': url_3w,
        'priority': priority,
        'url': url,

        'quality': quality,
        'commentStatus': commentStatus,
        'ename': ename,
        'replyCount': replyCount,
        'ltitle': ltitle,

        'hasIcon': hasIcon,
        'subtitle': subtitle,
        'cid': cid,
        'ads': ads,
      };
}


//头条数据模型
class AdsModel {
  String subtitle;
  String skipType;
  String skipID;
  String tag;
  String title;
  String imgsrc;
  String url;
  AdsModel();

  AdsModel.fromJson(Map<String, dynamic> json)
      : subtitle = json['subtitle'],
        skipType = json['skipType'],
        skipID = json['skipID'],
        tag = json['tag'],
        title = json['title'],
        imgsrc = json['imgsrc'],
        url = json['url'];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'subtitle': subtitle,
        'skipType': skipType,
        'skipID': skipID,
        'tag': tag,
        'title': title,
        'imgsrc': imgsrc,
        'url': url,
      };
}


//