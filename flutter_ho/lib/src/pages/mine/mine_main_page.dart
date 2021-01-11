import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ho/src/pages/common/user_helper.dart';
import 'package:flutter_ho/src/pages/mine/mine_login_page.dart';
import 'package:flutter_ho/src/pages/mine/mine_no_login_page.dart';

class MineMainPage extends StatefulWidget {
  @override
  _MineMainPageState createState() => _MineMainPageState();
}

class _MineMainPageState extends State<MineMainPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      child: buildMainBody(),
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark, // 这句在我手机上好像没有实现诶。。
        statusBarColor: Color(0xffCDDEEC),
      ),
    );
  }

  buildMainBody() {
    // 判断用户是否已经登录
    if (UserHelper.getInstance.isLogin) {
      // 构建用户已登录的页面
      return MineLoginPage();
    } else {
      // 构建用户未登录的页面
      return MineNoLoginPage();
    }
  }
}
