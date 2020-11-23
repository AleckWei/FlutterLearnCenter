import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// flutter当中的静态列表

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

  // 自定义方法
  List<Widget> _getData() {
    return [
      ListTile(
        title: Text('我是列表'),
      ),
      ListTile(
        title: Text('我是列表'),
      ),
      ListTile(
        title: Text('我是列表'),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 180,
        child: ListView(
          children: this._getData(),
        )
    );
  }
}
