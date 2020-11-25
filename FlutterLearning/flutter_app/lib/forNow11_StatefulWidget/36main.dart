import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

// void main() {
//   runApp(MyApp());
// }

// StatefulWidget
// 通过按钮向列表当中动态添加若干数据，StatefulWidget的简单应用

//自定义组件 == 创建一个类：
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 一般作为app的根组件
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Demo',
          ),
          centerTitle: true,
        ),
        body: HomePage2(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

// 有状态的组件
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        Chip(label: Text('你好~${this.count}')),
        SizedBox(height: 20),
        RaisedButton(
          onPressed: () {
            setState(() {
              // 只有继承了StatefulWidget才有这个setState方法
              this.count++;
            });
          },
          child: Text('按钮'),
        )
      ],
    );
  }
}

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List list = new List();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: this.list.map((value) {
            return ListTile(
              title: value,
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        RaisedButton(
          onPressed: () {
            setState(() {
              this.list.add(Text('新增数据1'));
              this.list.add(Text('新增数据2'));
            });
          },
          child: Text('按钮~'),
        ),
      ],
    );
  }
}
