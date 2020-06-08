
//账户信息
class User {
    String avatar_url;//用户头像地址
    String bio;//用户简介
    String blog;//博客地址
    String company;//公司
    String created_at;//账号创建时间
    String email;//邮箱
    int followers;//关注该用户的人数
    int following;//该用户关注的人数
    bool hireable;
    String location;//用户所处地理位置
    String login;//用户登录名
    String name;//用户名字
    int owned_private_repos;//该用户自己的私有项目数
    int public_repos;//公开项目数
    int total_private_repos;//该用户总的私有项目数(包括参与的其它组织的私有项目)
    String type;//用户类型，可能是组织
    String updated_at;//账号信息更新时间

    User({this.avatar_url, this.bio, this.blog, this.company, this.created_at, this.email, this.followers, this.following, this.hireable, this.location, this.login, this.name, this.owned_private_repos, this.public_repos, this.total_private_repos, this.type, this.updated_at});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            avatar_url: json['avatar_url'],
            bio: json['bio'],
            blog: json['blog'],
            company: json['company'],
            created_at: json['created_at'],
            email: json['email'],
            followers: json['followers'],
            following: json['following'],
            hireable: json['hireable'],
            location: json['location'],
            login: json['login'],
            name: json['name'],
            owned_private_repos: json['owned_private_repos'],
            public_repos: json['public_repos'],
            total_private_repos: json['total_private_repos'],
            type: json['type'],
            updated_at: json['updated_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_url'] = this.avatar_url;
        data['bio'] = this.bio;
        data['blog'] = this.blog;
        data['company'] = this.company;
        data['created_at'] = this.created_at;
        data['email'] = this.email;
        data['followers'] = this.followers;
        data['following'] = this.following;
        data['hireable'] = this.hireable;
        data['location'] = this.location;
        data['login'] = this.login;
        data['name'] = this.name;
        data['owned_private_repos'] = this.owned_private_repos;
        data['public_repos'] = this.public_repos;
        data['total_private_repos'] = this.total_private_repos;
        data['type'] = this.type;
        data['updated_at'] = this.updated_at;
        return data;
    }

}