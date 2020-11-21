import 'package:flutter/material.dart';
import 'res/listData.dart';

void main() {
  runApp(MyApp());
}

// GridView的最基本的使用

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
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
      ],
    );
  }
}
