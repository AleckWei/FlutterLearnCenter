import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// 使用ListView Builder创建一个ListView

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

// ignore: must_be_immutable
class HomeContent extends StatelessWidget {
  List list = new List();

  // 在构造函数中添加一个List，后面用于在Container中展示
  HomeContent() {
    for (var i = 1; i <= 20; i++) {
      this.list.add(ListTile(
            title: Text('我是第$i个标题'),
            subtitle: Text('我是第$i条数据的副标题'),
          ));
      // this.list.add('我是第$i条数据');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.list.length,
        itemBuilder: (context, index) {
          // return ListTile(
          //   title: Text(this.list[index]),
          // );
          return this.list[index];
        });
  }
}
