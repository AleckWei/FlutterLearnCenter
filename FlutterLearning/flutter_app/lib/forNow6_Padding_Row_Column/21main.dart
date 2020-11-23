import 'package:flutter/material.dart';
import '../res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// 对垂直布局组件Column进行一个介绍以及属性的详解

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
        body: LayoutDemo(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 500.0,
      width: 350.0,
      color: Colors.limeAccent,
      child: Column(
        // 3个按钮组件被我们像这样放置到了一行当中
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 调整主轴的排列(如果是Column,它就是垂直的方向)
        // spaceAround 元素与元素之间的距离 是 元素与边界的距离
        // spaceBetween 表示元素距离左右是没有距离的，但是元素与元素之间的距离是相等的
        // spaceEvenly (使用较多)元素与元素 元素与边界的距离 都是相等的
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconContainer(Icons.home, color: Colors.black54),
          IconContainer(Icons.search, color: Colors.orangeAccent),
          IconContainer(Icons.star, color: Colors.teal),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  double size = 32.0;
  Color color = Colors.redAccent;
  IconData icon;

  IconContainer(this.icon, {this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: this.color,
      ),
    );
  }
}
