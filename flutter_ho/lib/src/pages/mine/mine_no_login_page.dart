import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/login/login_page.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';

// 用户未登录下的页面
class MineNoLoginPage extends StatefulWidget {
  @override
  _MineNoLoginPageState createState() => _MineNoLoginPageState();
}

class _MineNoLoginPageState extends State<MineNoLoginPage> {
  bool _isDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffCDDEEC),
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            child: buildHero(),
            onTapDown: (TapDownDetails details) {
              // 手指按下时的回调
              // 需求：按下需要阴影
              setState(() {
                _isDown = true;
              });
            },
            onTapCancel: () {
              // 手指移出的回调
              // 需要：移出需要将阴影还原
              setState(() {
                _isDown = false;
              });
            },
            onTap: () {
              // 跳转登录页面
              setState(() {
                _isDown = false;
              });
              NavigatorUtils.pushPageByFade(
                context: context,
                targetPage: LoginPage(),
                startMills: 1200,
              );
            },
          ),
        ],
      ),
    );
  }

  Hero buildHero() {
    return Hero(
      tag: "login",
      child: Material(
        color: Colors.transparent,
        child: buildContainer(),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      alignment: Alignment.center,
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(43)),
        boxShadow: _isDown
            ? [
                BoxShadow(
                  offset: Offset(3, 4),
                  color: Colors.black,
                  blurRadius: 13,
                ),
              ]
            : null,
      ),
      child: Text(
        '登录',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
