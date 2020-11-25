import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import '../res/listData.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

// void main() {
//   runApp(MyApp());
// }

// StatefulWidget
// 使用StatelessWidget修改页面数值的错误示例

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
        body: HomePage(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Text('你好！${this.count}'),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          onPressed: () {
            this.count++; // 在StatelessWidget当中，虽然可以实现这个++
            // 但是不会呈现到页面上
            print(this.count);
          },
          child: Text('你好！'),
        )
      ],
    );
  }
}
