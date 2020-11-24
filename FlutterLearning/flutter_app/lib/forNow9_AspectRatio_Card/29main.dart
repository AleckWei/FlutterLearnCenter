import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// Card当中使用ListTile对卡片进行设计

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
    return ListView(
      // ListView当中无法再嵌套一个ListView
      children: [
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '韦武浚',
                  style: TextStyle(fontSize: 28),
                ),
                subtitle: Text('软件工程师'),
              ),
              ListTile(
                title: Text('电话:xxxx'),
              ),
              ListTile(
                title: Text('地址:xxxx'),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '李四',
                  style: TextStyle(fontSize: 28),
                ),
                subtitle: Text('软件工程师'),
              ),
              ListTile(
                title: Text('电话:xxxx'),
              ),
              ListTile(
                title: Text('地址:xxxx'),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '王五',
                  style: TextStyle(fontSize: 28),
                ),
                subtitle: Text('软件工程师'),
              ),
              ListTile(
                title: Text('电话:xxxx'),
              ),
              ListTile(
                title: Text('地址:xxxx'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
