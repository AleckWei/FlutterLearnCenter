import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/home_page.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';

// 倒计时页面（从welcome_page.dart中抽离出来）
class WelcomeTimeWidget extends StatefulWidget {
  @override
  _WelcomeTimeWidgetState createState() => _WelcomeTimeWidgetState();
}

class _WelcomeTimeWidgetState extends State<WelcomeTimeWidget> {
  int currentTime = 3;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      // 创建计时器，每秒执行一次callBack
      Duration(seconds: 1),
      (timer) {
        if (currentTime == 0) {
          //  停止计时器，前往首页
          _timer.cancel();
          goHome();
          return;
        }
        setState(() {
          currentTime--;
        });
        LogUtils.e('计时器回调');
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_timer.isActive) {
      // 计时器养成良好习惯，在页面销毁的时候
      // 必定要执行一次取消计时器的操作
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 之所以不使用InkWell触发点击事件
      // 是因为它的点击会有水波纹效果
      child: TimerContainer(),
      onTap: () {
        goHome();
      },
    );
  }

  Container TimerContainer() {
    return Container(
      width: 80,
      height: 33,
      // 子widget的居中方式
      alignment: Alignment.center,
      child: Text(
        '${currentTime}s',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
          color: Colors.blue,
        ),
      ),
      decoration: BoxDecoration(
        // 设置边框的颜色以及宽度
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
        // 设置边框的圆角
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  void goHome() {
    LogUtils.e('计时完成，去首页');
    NavigatorUtils.pushPageByFade(
      context: context,
      targetPage: HomePage(),
      isReplace: true,
    );
  }
}
