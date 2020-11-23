import 'package:flutter/material.dart';
import 'res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// GridView，使用一个for循环，静态地添加20条数据

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
  // ignore: missing_return
  List<Widget> _getListData() {
    List<Widget> list = new List();

    for (var i = 1; i <= 20; i++) {
      list.add(Container(
        alignment: Alignment.center,
        child: Text(
          '这是第$i条数据',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: Colors.orangeAccent,
        // height: 400, // 设置高度是没有反应的
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0, // 水平元素之间的距离
      mainAxisSpacing: 10.0, // 垂直元素之间的距离
      padding: EdgeInsets.all(10),
      childAspectRatio: 0.7, // 每一个GridView的宽比高的比例
      children: this._getListData(),
    );
  }
}
