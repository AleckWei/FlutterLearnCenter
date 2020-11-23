import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// flutter当中的动态列表,用for循环创建这个ListView

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
    List<Widget> list = new List();
    for(var i=0;i<20;i++){
      list.add(ListTile(
        title: Text('我是第$i个标题'),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getData(),
    );
  }
}
