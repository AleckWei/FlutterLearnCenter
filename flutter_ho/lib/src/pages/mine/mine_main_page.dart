import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/common/user_helper.dart';

class MineMainPage extends StatefulWidget {
  @override
  _MineMainPageState createState() => _MineMainPageState();
}

class _MineMainPageState extends State<MineMainPage> {
  @override
  Widget build(BuildContext context) {

    // 判断用户是否已经登录
    if(UserHelper.getInstance.isLogin) {
      // 构建用户已登录的页面
    } else {
      // 构建用户未登录的页面
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
