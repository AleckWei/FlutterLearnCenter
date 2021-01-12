import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/login/bubble_bg/bubble_widget.dart';
import 'package:flutter_ho/src/pages/login/custom_textfield_wiget.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _phoneNumberFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();

  TextEditingController _userPhoneEditController = new TextEditingController();
  TextEditingController _userPswEditController = new TextEditingController();

  // 控制密码是否显示
  bool _pwsShow = true;

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
            // 第三层 高斯模糊（装饰上一层的气泡）
            buildCosmosWidget(),
            // 第四层 logo
            buildLogoWidget(),
            // 第五层 输入框
            Positioned(
              left: 60,
              right: 60,
              bottom: 60,
              child: Column(
                children: [
                  // 手机号
                  TextFieldWidget(
                    hintText: '手机号',
                    submit: (val) {},
                    focusNode: _phoneNumberFocusNode,
                    prefixIconData: Icons.smartphone_sharp,
                    controller: _userPhoneEditController,
                    obscureText: false,
                    onTap: () {
                      setState(() {
                        _pwsShow = !_pwsShow;
                      });
                    },
                  ),
                  SizedBox(height: 40),
                  // 密码
                  TextFieldWidget(
                    hintText: '密码',
                    submit: (val) {},
                    focusNode: _passwordFocusNode,
                    prefixIconData: Icons.lock_open_outlined,
                    suffixIconData:
                        _pwsShow ? Icons.visibility_off : Icons.visibility,
                    obscureText: _pwsShow,
                    controller: _userPswEditController,
                    onTap: () {
                      setState(() {
                        _pwsShow = !_pwsShow;
                      });
                    },
                  ),
                  SizedBox(height: 40),
                  // 登录
                  Container(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      child: Text(
                        '登录',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        LogUtils.e('点击了登录');
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  // 注册
                  Container(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      child: Text(
                        '注册',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        LogUtils.e('点击了注册');
                      },
                    ),
                  ),
                ],
              ),
            ),
            // 第六层 关闭按钮
            buildCloseButtonWidget(context),
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

  // 左上角的关闭按钮
  Positioned buildCloseButtonWidget(BuildContext context) {
    return Positioned(
      left: 10,
      top: 64,
      child: CloseButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
