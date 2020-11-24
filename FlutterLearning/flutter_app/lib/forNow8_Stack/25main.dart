import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// Stack的应用,用Alignment(x,y)控制所有组件所在位置

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
        alignment: Alignment(0.3, -0.7),
        // (1,1)表示右下角,(0,0)表示居中,以此类推
        // 但是这样没法对Stack中的所有的组件都改变它们的位置
        children: <Widget>[
          Container(
            height: 400,
            width: 300,
            color: Colors.orangeAccent,
          ),
          Text(
            '文本',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text('???'),
        ],
      ),
    );
  }
}
