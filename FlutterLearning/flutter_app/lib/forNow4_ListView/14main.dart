import 'package:flutter/material.dart';
import '../res/listData.dart';

// void main() {
//   runApp(MyApp());
// }
// 使用ListView Builder并结合listData中的数组
// 创建一个ListView

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
  // List list = new List();
  //
  // // 在构造函数中添加一个List，后面用于在Container中展示
  // HomeContent() {
  //   for (var i = 1; i <= 20; i++) {
  //     this.list.add(ListTile(
  //           title: Text('我是第$i个标题'),
  //           subtitle: Text('我是第$i条数据的副标题'),
  //         ));
  //     // this.list.add('我是第$i条数据');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: this._getListData
        // 不带()表示函数的赋值，带了()表示函数的执行
        );
  }

  Widget _getListData(context, index) {
    return ListTile(
      leading: Image.network('imageUrl'),
      title: Text(listData[index]['title']),
      subtitle: Text(listData[index]['author']),
    );
  }
}
