import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/bean/bean_user.dart';
import 'package:flutter_ho/src/net/dio_utils.dart';
import 'package:flutter_ho/src/net/http_helper.dart';
import 'package:flutter_ho/src/pages/common/controller.dart';
import 'package:flutter_ho/src/pages/common/user_helper.dart';
import 'package:flutter_ho/src/pages/login/bubble_bg/bubble_widget.dart';
import 'package:flutter_ho/src/pages/login/custom_textfield_wiget.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:flutter_ho/src/utils/toast_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 手机号码输入焦点框
  FocusNode _phoneNumberFocusNode = new FocusNode();

  // 密码输入焦点框
  FocusNode _passwordFocusNode = new FocusNode();

  // 手机号码输入框控制器
  TextEditingController _userPhoneEditController = new TextEditingController();

  // 密码输入框控制器
  TextEditingController _userPswEditController = new TextEditingController();

  // 控制密码是否显示
  bool _pwsShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: buildGestureDetectorOutSideBackground(context),
      ),
    );
  }

  // 当点击最外层的时候，就将键盘收起来
  Widget buildGestureDetectorOutSideBackground(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 当点击输入框以外的地方，就将输入框隐藏
        _phoneNumberFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
      child: buildStackWidget(context),
    );
  }

  // 构成主页面的层叠布局
  Container buildStackWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
          buildInputWidget(context),
          // 第六层 关闭按钮
          buildCloseButtonWidget(context),
        ],
      ),
    );
  }

  // 1.背景层
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

  // 3.高斯模糊层
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

  // 4.logo与“欢迎登陆”层
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

  // 5.输入框
  Positioned buildInputWidget(BuildContext context) {
    return Positioned(
      left: 60,
      right: 60,
      bottom: 60,
      child: Column(
        children: [
          // 手机号
          TextFieldWidget(
            hintText: '手机号',
            submit: (val) {
              if (val.length != 11) {
                ToastUtils.showToast("请输入11位手机号");
                FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
                return;
              }
              _phoneNumberFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
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
            submit: (val) {
              if (val.length < 6) {
                ToastUtils.showToast('请输入6位数以上的密码');
                FocusScope.of(context).requestFocus(_passwordFocusNode);
                return;
              }
              _phoneNumberFocusNode.unfocus();
              _passwordFocusNode.unfocus();
              submitFunction();
            },
            focusNode: _passwordFocusNode,
            prefixIconData: Icons.lock_open_outlined,
            suffixIconData: _pwsShow ? Icons.visibility_off : Icons.visibility,
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
                submitFunction();
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
    );
  }

  // 6.左上角的关闭按钮
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

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneNumberFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    super.dispose();
  }

  void submitFunction() async {
    // 获取用户名
    String userPhone = _userPhoneEditController.text;
    // 获取密码
    String userPsw = _userPswEditController.text;

    // 获取到用户名后去除空格再做一次判断
    if (userPhone.trim().length != 11) {
      ToastUtils.showToast('请输入11位手机号');
      return;
    }

    // 获取到密码后去除空格再做一次判断
    if (userPsw.trim().length < 6) {
      ToastUtils.showToast('请输入6位以上密码');
      return;
    }

    Map<String, dynamic> map = {
      "mobile": userPhone,
      "password": userPsw,
    };

    // ResponseInfo responseInfo = await DioUtils.instance.postRequest(
    //   url: HttpHelper.login,
    //   formDataMap: map,
    // );
    // 模拟登录成功
    ResponseInfo responseInfo = await Future.delayed(
      Duration(milliseconds: 1000),
      () {
        return ResponseInfo(
          data: {
            "mobile": "测试数据",
            "password": 12345678,
          },
        );
      },
    );

    // 响应成功
    if (responseInfo.success) {
      // 解析数据
      UserBean userBean = UserBean.fromMap(responseInfo.data);
      // 内存保存数据
      UserHelper.getInstance.userBean = userBean;
      // toast提示
      ToastUtils.showToast("登录成功");
      // 发送消息更新我的页面显示内容
      Navigator.of(context).pop(true);
      loginStreamController.add(0);
    } else {
      ToastUtils.showToast("${responseInfo.message}");
    }
  }
}
