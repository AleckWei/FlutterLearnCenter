import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import '../res/listData.dart';
import 'package:flutter_app/forNow12_NavigationBar/pages/Tabs.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

// void main() {
//   runApp(MyApp());
// }

// BottomNavigationBar
// 抽离了tabs组件,让main.dart的逻辑代码变得十分简洁
// 主要的跳转逻辑放在了Tabs.dart文件当中

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

