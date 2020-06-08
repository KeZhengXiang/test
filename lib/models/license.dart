
//开源许可证
class License {
    String key;
    String name;
    String node_id;
    String spdx_id;
    String url;

    License({this.key, this.name, this.node_id, this.spdx_id, this.url});

    factory License.fromJson(Map<String, dynamic> json) {
        return License(
            key: json['key'], 
            name: json['name'], 
            node_id: json['node_id'], 
            spdx_id: json['spdx_id'], 
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['key'] = this.key;
        data['name'] = this.name;
        data['node_id'] = this.node_id;
        data['spdx_id'] = this.spdx_id;
        data['url'] = this.url;
        return data;
    }
}