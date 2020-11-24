import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

void main() {
  runApp(MyApp());
}

// 根据视图做的一个demo,然后针对下面3个图片进行了添加圆角的操作
// 让ui更加圆润
// 进一步封装了背景有Image的Container

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
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 70),
                      Text(
                        '你好呀~',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ))
          ],
        ),
        SizedBox(height: 10),
        RowContainer(),
      ]),
    );
  }
}

class RowContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MyContainer.only('https://www.itying.com/images/flutter/1.png',
              height: 180,
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          flex: 2,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 180,
            child: ListView(
              children: [
                MyContainer.only(
                  'https://www.itying.com/images/flutter/2.png',
                  height: 85,
                  topRight: Radius.circular(10),
                ),
                SizedBox(height: 10),
                MyContainer.only(
                  'https://www.itying.com/images/flutter/3.png',
                  height: 85,
                  bottomRight: Radius.circular(10),
                ),
              ],
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }
}
