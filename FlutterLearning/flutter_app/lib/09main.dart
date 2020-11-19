import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
// 又是手动地添加了一堆屎。。。
// 实现了一个 标题 - 图片 的长列表

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 180,
      child: ListContent(),
    );
  }
}

class ListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 180,
          height: 180,
          color: Colors.red,
        ),
        Container(
          width: 180,
          height: 180,
          color: Colors.blue,
        ),
        Container(
          width: 180,
          height: 180,
          color: Colors.deepOrangeAccent,
        ),
        Container(
          width: 180,
          height: 180,
          color: Colors.deepOrange,
          child: ListView(
            children: <Widget>[
              Image.network(
                  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2541977328,1379583476&fm=26&gp=0.jpg'),
              Text(
                '标题？？',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          width: 180,
          height: 180,
          color: Colors.tealAccent,
        ),
        Container(
          width: 180,
          height: 180,
          color: Colors.teal,
        ),
        Container(
          width: 180,
          height: 180,
          color: Colors.yellowAccent,
        ),
      ],
    );
  }
}
