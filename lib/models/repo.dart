
import 'package:myapp/models/User.dart';

import 'license.dart';

//项目信息
class Repo {
    int id;
    String name;//项目名称
    String full_name;//项目完整名称
    User owner;//项目拥有者
    Repo parent;//如果是fork的项目，则此字段表示fork的父项目信息
    bool private;//是否私有项目
    String description;//项目描述
    bool fork;//该项目是否为fork的项目
    String language;//该项目的主要编程语言
    int forks_count;//fork了该项目的数量
    int stargazers_count;//该项目的star数量
    int size;//项目占用的存储大小
    String default_branch;//项目的默认分支
    int open_issues_count;//该项目当前打开的issue数量
    String pushed_at;
    String created_at;
    String updated_at;
    int subscribers_count;//订阅（关注）该项目的人数
    License license;//该项目的开源许可证

    Repo({this.private, this.created_at, this.default_branch, this.description, this.fork, this.forks_count, this.full_name, this.id, this.language, this.license, this.name, this.open_issues_count, this.owner, this.parent, this.pushed_at, this.size, this.stargazers_count, this.subscribers_count, this.updated_at});

    factory Repo.fromJson(Map<String, dynamic> json) {
        return Repo(
            private: json['`private`'],
            created_at: json['created_at'], 
            default_branch: json['default_branch'], 
            description: json['description'], 
            fork: json['fork'], 
            forks_count: json['forks_count'], 
            full_name: json['full_name'], 
            id: json['id'], 
            language: json['language'], 
            license: json['license'] != null ? License.fromJson(json['license']) : null, 
            name: json['name'], 
            open_issues_count: json['open_issues_count'], 
            owner: User.fromJson(json['owner']),
            parent: Repo.fromJson(json['parent']),
            pushed_at: json['pushed_at'], 
            size: json['size'], 
            stargazers_count: json['stargazers_count'], 
            subscribers_count: json['subscribers_count'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['`private`'] = this.private;
        data['created_at'] = this.created_at;
        data['default_branch'] = this.default_branch;
        data['description'] = this.description;
        data['fork'] = this.fork;
        data['forks_count'] = this.forks_count;
        data['full_name'] = this.full_name;
        data['id'] = this.id;
        data['language'] = this.language;
        data['name'] = this.name;
        data['open_issues_count'] = this.open_issues_count;
        data['owner'] = this.owner.toJson();
        data['parent'] = this.parent.toJson();
        data['pushed_at'] = this.pushed_at;
        data['size'] = this.size;
        data['stargazers_count'] = this.stargazers_count;
        data['subscribers_count'] = this.subscribers_count;
        data['updated_at'] = this.updated_at;
        if (this.license != null) {
            data['license'] = this.license.toJson();
        }
        return data;
    }
}