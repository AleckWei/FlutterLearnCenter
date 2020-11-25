import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import '../res/listData.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

// void main() {
//   runApp(MyApp());
// }

// BottomNavigationBar
// 自定义底部导航条,使用了一些基本属性去获取选中的下标
// 对复杂的代码进行初步的分离,实现动态选中图标改变图标被选中的样式

//自定义组件 == 创建一个类：
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 一般作为app的根组件
      home: Tabs(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Demo',
        ),
        centerTitle: true,
      ),
      body: Text('tarBar'),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, // 下标从0开始，1表示默认选中第2个
        onTap: (int index){
          print('选中的下标：'+index.toString());
          setState(() {
            this._currentIndex = index; // 这段就是动态改变选中的图标
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.category),title: Text("分类")),
          BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text("设置")),
        ],
      ),
    );
  }
}

