import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// Stack的应用,用Positioned控制其中某个组件相对于外层容器的位置
// 可以更加灵活，但是不清楚会不会出现不适配的问题

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
    return AspectRatio(
      // 这个组价会让里面的Container尽可能地铺满父组件
      aspectRatio: 3.0 / 1.0, // 配置子元素的宽高比
      // 现在这样相当于让整个页面当父组件
      child: Container(
        color: Colors.orangeAccent,
      ),
    );
  }
}
