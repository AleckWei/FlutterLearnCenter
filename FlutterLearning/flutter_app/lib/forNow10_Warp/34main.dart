import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import '../res/listData.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

// void main() {
//   runApp(MyApp());
// }

// Card当中使用ListTile对卡片进行设计
// 这一部分用遍历的方法去读取listData当中的数据

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
    return Container(
      height: 500,
      width: 300,
      color: Colors.indigo,
      child: Wrap(
        // Wrap 组件的作用就是当主轴放不下内容
        // 的时候，就会自动向垂直轴扩展过去
        direction: Axis.vertical,
        spacing: 10, // 主轴上的间距
        runSpacing: 25, // 纵轴上的间距(纵轴是垂直于主轴的，当主轴是x轴的话，纵轴就是y轴)
        // alignment: WrapAlignment.spaceEvenly,
        // runAlignment: WrapAlignment.spaceEvenly, // 将其中的控件控制其在纵轴上的排列方式
        children: [
          MyButton('111'),
          MyButton('212431242422'),
          MyButton('3433'),
          MyButton('4451345144'),
          MyButton('5154355'),
          MyButton('66651'),
          MyButton('777'),
          MyButton('88'),
          MyButton('94513499'),
          MyButton('14411'),
          MyButton('225612'),
          MyButton('3533'),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  String _title = '';

  MyButton(this._title);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this._title),
      textColor: Theme.of(context).accentColor,
      onPressed: () {
        log(1111);
      },
      // 当没有设置onPressed方法时，按钮默认是置灰的，按钮的样式不会被改变
    );
  }
}
