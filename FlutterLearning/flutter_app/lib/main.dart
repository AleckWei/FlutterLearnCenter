import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
// 实现圆角以及设置圆角图片
// 稍微麻烦的方法：先将container设置成圆的，然后再将其背景用一张图片来填充。

//自定义组件 == 创建一个类：
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 一般作为app的根组件
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: ClipOval(
          child: Image.asset(
            'images/a.png',
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
