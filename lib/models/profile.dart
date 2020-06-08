

import 'cacheConfig.dart';
import 'user.dart';


//用户全部信息
class Profile {
    CacheConfig cache = CacheConfig();//缓存策略信息
    String lastLogin;//最近一次的注销登录的用户名
    String locale = "dart";//APP语言信息
    int theme;//主题色值
    String token;//登录用户的token(oauth)或密码
    User user;//账号信息

    Profile({this.cache, this.lastLogin, this.locale, this.theme, this.token, this.user});

    factory Profile.fromJson(Map<String, dynamic> json) {
        return Profile(
            cache: CacheConfig.fromJson(json['cache']),
            lastLogin: json['lastLogin'], 
            locale: json['locale'], 
            theme: json['theme'], 
            token: json['token'], 
            user: User.fromJson(json['user']),
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cache'] = this.cache.toJson();
        data['lastLogin'] = this.lastLogin;
        data['locale'] = this.locale;
        data['theme'] = this.theme;
        data['token'] = this.token;
        data['user'] = this.user.toJson();
        return data;
    }
}