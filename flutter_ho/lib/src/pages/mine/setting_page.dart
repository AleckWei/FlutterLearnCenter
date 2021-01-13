import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/common/app_upgrade.dart';
import 'package:flutter_ho/src/pages/common/controller.dart';
import 'package:flutter_ho/src/pages/common/user_helper.dart';
import 'package:flutter_ho/src/pages/login/login_page.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';
import 'package:package_info/package_info.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginStreamController.stream.listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置中心"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          buildLoginOutWidget(),
          buildCheckVersion(),
        ],
      ),
    );
  }

  ListTile buildLoginOutWidget() {
    bool isLogin = UserHelper.getInstance.isLogin;
    return ListTile(
      title: Text(isLogin ? '退出登录' : '去登录'),
      // 右侧的图标（右箭头）
      trailing: Icon(Icons.arrow_forward_ios),
      // 左侧的图标（x）
      leading: Icon(Icons.cancel_presentation_sharp),
      onTap: () {
        if (isLogin) {
          exitFunction();
        } else {
          NavigatorUtils.pushPage(context: context, targetPage: LoginPage());
        }
      },
    );
  }

  void exitFunction() async {
    bool isExit = await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('温馨提示'),
          content: Container(
            padding: EdgeInsets.all(16),
            child: Text('确定退出吗？'),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            CupertinoDialogAction(
              child: Text('退出'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (isExit) {
      UserHelper.getInstance.clear();
      Navigator.of(context).pop(true);
    }
  }

  buildCheckVersion() {
    // 第二部分：检查更新
    if (Platform.isAndroid) {
      return ListTile(
        leading: Icon(Icons.web_sharp),
        title: Text('检查更新'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          checkVersion();
        },
      );
    } else {
      return Container();
    }
  }

  void checkVersion() async {
    // 获取当前app的版本信息
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String builderNumber = packageInfo.buildNumber; // 编译次数

    LogUtils.e('appName $appName');
    LogUtils.e('packageName $packageName');
    LogUtils.e('version $version');
    LogUtils.e('builderNumber $builderNumber');

    // 这里需要调用一个全局的检查方法
    // 里面已经复写了一个widget充当弹窗了
    checkAppVersion(context, showToast: true);
  }
}
