import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ho/src/pages/common/controller.dart';
import 'package:flutter_ho/src/pages/common/user_helper.dart';
import 'package:flutter_ho/src/pages/mine/mine_login_page.dart';
import 'package:flutter_ho/src/pages/mine/mine_no_login_page.dart';
import 'package:flutter_ho/src/pages/mine/setting_page.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';

class MineMainPage extends StatefulWidget {
  @override
  _MineMainPageState createState() => _MineMainPageState();
}

class _MineMainPageState extends State<MineMainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 添加一个登录的监听，如果监听到有值返回，就刷新一下页面状态
    loginStreamController.stream.listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          // ios中状态栏的文字为白色
          statusBarBrightness: Brightness.dark,
          // 这句在我手机上好像没有实现诶。。
          // = = 废话，拿的安卓机呢。。
          // android的状态栏的颜色
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
          children: [
            // 主区域的设置
            Positioned.fill(
              child: buildMainBody(),
            ),
            // 右上角的设置按钮
            Positioned(
              top: 44,
              right: 16,
              child: buildSettingButton(context),
            ),
          ],
        ));
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

  IconButton buildSettingButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings_applications_outlined),
      onPressed: () {
        NavigatorUtils.pushPage(
          context: context,
          targetPage: SettingPage(),
          dismissCallBack: (val) {
            if (val != null) {
              setState(() {});
            }
          },
        );
      },
    );
  }
}
