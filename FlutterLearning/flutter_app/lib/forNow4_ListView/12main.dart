import 'package:flutter/material.dart';
import '../res/listData.dart';

// void main() {
//   runApp(MyApp());
// }
// flutter当中的动态列表,用for循环创建这个ListView
// for循环读取我们事先定义好的listData

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
    var tempList = listData.map((value){
      return ListTile(
        leading: Image.network(value["imageUrl"]),
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getData(),
    );
  }
}
