import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// 实现圆角以及设置圆角图片
// 稍微简单的方法：用ClipOval去包含这个image，它能对图片进行圆化处理

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
    return Center(
      child: Container(
        child: ClipOval(
          child: Image.network(
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3963453026,374513604&fm=26&gp=0.jpg",
            // 如果给入的图片是一个正方形，那么它呈现出来的就是一个圆
            // 如果给入的图片是一个长方形，那么它呈现出来的就是一个椭圆
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            // 加了height、width和cover之后，就怎么都能弄出一个圆形了
          ),

        ),
      ),
    );
  }
}
