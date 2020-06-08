
import 'package:flutter/material.dart';
import 'package:myapp/common/global.dart';
import 'package:myapp/common/log_utils.dart';
import 'package:myapp/http/Git.dart';
import 'package:myapp/models/user.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {

  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;//自动填充用户名

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin;
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }

    ProgressDialogInit();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    hidePross(immediately: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "你的用户名或邮箱",
                    prefixIcon: Icon(Icons.person),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : "用户名不能为空";
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "密码",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                //校验密码（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : "密码不能为空";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    textColor: Colors.white,
                    child: Text("登录"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  //登录
  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
//      await showPross();
      User user;
      try {
        user = await Git(context).login(_unameController.text, _pwdController.text);
        if(!this.mounted) return;
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
//        Provider.of<UserModel>(context, listen: false).user = user;
//        pr.update(progress: 0, message: "登录成功");
        LogUtils.log("登录成功");
//        hidePross();
      } catch (e) {
        //登录失败则提示
        if (e.response?.statusCode == 401) {
//          pr.update(progress: 0, message: "userNameOrPasswordWrong");
        } else {
//          pr.update(progress: 0, message: "登录失败");
        }
        LogUtils.log("登录失败${e.toString()}");
//        hidePross();
      } finally {
        // 隐藏loading框
        Navigator.of(context).pop();
      }
      if (user != null) {
        // 返回
        Navigator.of(context).pop();
      }
    }
  }

  //登录弹窗
  ProgressDialog pr;
  void ProgressDialogInit(){
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: true,
      showLogs: true,
//      customBody: LinearProgressIndicator(
//        valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
//        backgroundColor: Colors.white,
//      ),
    );
    pr.style(
//      message: 'Downloading file...',
      message: '我是进度对话框文本',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.bounceIn,
      progress: 0.0,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
  }

  void showPross() async{
    pr.update(
      progress: 0,
      message: "正在登录...",
      progressWidget: Container(
//            padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: TextStyle( color: Colors.black, fontSize: 13.0,
          fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle( color: Colors.black, fontSize: 19.0,
          fontWeight: FontWeight.w600),
    );
    await pr.show();
  }

  void hidePross({immediately = false}){
    if(immediately){
      if (pr?.isShowing() ?? false)
        pr.hide().then((isHidden) {
          print(isHidden);
        });
      return;
    }
    Future.delayed(Duration(seconds: 2)).then((onValue) {
      if (pr?.isShowing() ?? false)
        pr.hide().then((isHidden) {
          print(isHidden);
        });
    });
  }
}

