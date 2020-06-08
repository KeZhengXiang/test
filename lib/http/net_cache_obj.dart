import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:myapp/common/global.dart';

//额外参数配置
//class ExtraKey{
//  static const String noCache = "noCache";// 标记是否缓存当前网络数据单元
//  static const String refresh = "refresh";// 标记是否是"下拉刷新"
//  static const String list = "list";
//
//
//}


//网络数据缓存对象（网络数据单元）
class CacheObject {
  CacheObject(this.response) : timeStamp = DateTime.now().millisecondsSinceEpoch;

  Response response;//完整请求数据
  int timeStamp;//缓存时间戳

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

//网络数据缓存插件（拦截器）
class NetCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  onRequest(RequestOptions options) async {
    //额外数据
    //options.extra["refresh"] bool 如果为true，则本次请求不使用缓存，但新的请求结果依然会被缓存
    //options.extra["noCache"] bool 本次请求禁用缓存，请求结果也不会被缓存。

    if (!Global.profile.cache.enable) {
      return options;
    }
    // refresh标记是否是"下拉刷新"
    bool refresh = options.extra["refresh"] == true;
    //如果是下拉刷新，先删除相关缓存
    if (refresh) {
      if (options.extra["list"] == true) {
        //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
        cache.removeWhere((key, v) => key.contains(options.path));
      } else {
        // 如果不是列表，则只删除uri相同的缓存
        delete(options.uri.toString());
      }
      return options;
    }
    if (options.extra["noCache"] != true && options.method.toLowerCase() == 'get') {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            Global.profile.cache.maxAge) {
          return cache[key].response;
        } else {
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
        }
      }
    }
  }

  @override
  onError(DioError err) async {
    // 错误状态不缓存
  }

  @override
  onResponse(Response response) async {
    // 如果启用缓存，将返回结果保存到缓存
    if (Global.profile.cache.enable) {
      _saveCache(response);
    }
  }

  _saveCache(Response object) {
    RequestOptions options = object.request;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == Global.profile.cache.maxCount) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(object);
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}