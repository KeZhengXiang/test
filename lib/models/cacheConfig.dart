
//API缓存策略信息
class CacheConfig {
    bool enable;//是否启用缓存
    int maxAge;//缓存的最长时间，单位（秒）
    int maxCount;//最大缓存数

    CacheConfig({this.enable = true, this.maxAge = 3600, this.maxCount = 100});

    factory CacheConfig.fromJson(Map<String, dynamic> json) {
        return CacheConfig(
            enable: json['enable'], 
            maxAge: json['maxAge'], 
            maxCount: json['maxCount'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['enable'] = this.enable;
        data['maxAge'] = this.maxAge;
        data['maxCount'] = this.maxCount;
        return data;
    }
}