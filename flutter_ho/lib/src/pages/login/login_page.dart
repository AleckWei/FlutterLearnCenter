import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/login/bubble_bg/bubble_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // 第一层 背景
            buildBackgroundWidget(),
            // 第二层 气泡
            Positioned.fill(
              child: BubbleWidget(),
            ),
            // 第2.5层 高斯模糊（装饰上一层的气泡）
            buildCosmosWidget(),
            // 第三层 logo
            buildLogoWidget(),
            // 第四层 输入框
          ],
        ),
      ),
    );
  }

  // 背景层
  Positioned buildBackgroundWidget() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          // 线性渐变
          gradient: LinearGradient(
            // 渐变开始的方向
            begin: Alignment.topLeft,
            // 渐变结束的方向
            end: Alignment.bottomRight,
            colors: [
              // 渐变的颜色组，最少都要2种颜色
              Colors.lightBlueAccent.withOpacity(0.3),
              Colors.blue.withOpacity(0.3),
              Colors.greenAccent.withOpacity(0.3),
              Colors.yellowAccent.withOpacity(0.1),
            ],
          ),
        ),
      ),
    );
  }

  // 高斯模糊层
  Positioned buildCosmosWidget() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 0.3,
          sigmaY: 0.3,
        ),
        child: Container(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }

  // logo与“欢迎登陆”层
  Positioned buildLogoWidget() {
    return Positioned(
      top: 120,
      left: 0,
      right: 0,
      child: Row(
        // 子widget水平居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'login',
            child: Material(
              color: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/ic_mylove.png',
                  width: 33,
                  height: 33,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            '欢迎登陆',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
