import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// Stack最基本的应用，使用Alignment去控制Stack组件中所有组件的共同方法

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
    return Center(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            height: 400,
            width: 300,
            color: Colors.orangeAccent,
          ),
          Text(
            '文本',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Text('???'),
        ],
      ),
    );
  }
}
