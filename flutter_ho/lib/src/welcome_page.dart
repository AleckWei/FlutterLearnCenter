import 'package:flutter/material.dart';
import 'package:flutter_ho/src/welcome_time_widget.dart';
import 'package:flutter_ho/src/welcome_video_widget.dart';

// 倒计时页面
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // 以上两个设计使页面填充全屏

        child: Stack(
          children: [
            //  第一层 背景 可以是一个图片
            //  也可以是一个视频播放
            Positioned.fill(
              child: WelcomeVideoWidget(),
            ),

            //  第二层是右下角的倒计时显示
            //  屏幕右下角对齐
            Positioned(
              child: WelcomeTimeWidget(),
              right: 20,
              bottom: 66,
            )
          ],
        ),
      ),
    );
  }
}
