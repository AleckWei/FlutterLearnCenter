import 'package:flutter/material.dart';

// 用户登录下的页面
class MineLoginPage extends StatefulWidget {
  @override
  _MineLoginPageState createState() => _MineLoginPageState();
}

class _MineLoginPageState extends State<MineLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录成功"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text('登录成功的页面'),
          ],
        ),
      ),
    );
  }
}
