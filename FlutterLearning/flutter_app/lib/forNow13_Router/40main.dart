import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_app/res/MyContainer.dart';
// import 'package:flutter_app/res/listData.dart';
import 'package:flutter_app/forNow13_Router/pages/Tabs.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

// void main() {
//   runApp(MyApp());
// }

// Flutter当中的路由跳转,简单来说就是页面的跳转
// Flutter当中的普通路由的使用
// 普通路由的传值:实际上就是调用要跳转页面的构造函数,在构造函数里面接收需要的值

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

