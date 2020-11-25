import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

void main() {
  runApp(MyApp());
}

// BottomNavigationBar
// 自定义底部导航条,使用了一些基本属性去获取选中的下标

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
        body: Text('tarBar'),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1, // 下标从0开始，这里表示默认选中第2个
          onTap: (int index){
            print('选中的下标：'+index.toString());
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
            BottomNavigationBarItem(icon: Icon(Icons.category),title: Text("分类")),
            BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text("设置")),
          ],
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
