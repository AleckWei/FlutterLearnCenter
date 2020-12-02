import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// 实现圆角以及设置圆角图片
// 稍微麻烦的方法：先将container设置成圆的，然后再将其背景用一张图片来填充。

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
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            // borderRadius: BorderRadius.circular(10),
            borderRadius: BorderRadius.circular(150), // 这样就是圆
            image: DecorationImage(
              image: NetworkImage(
                  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4267112760,2898039841&fm=26&gp=0.jpg"),
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}
