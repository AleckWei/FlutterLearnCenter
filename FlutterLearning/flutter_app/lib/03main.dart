import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// 引入远程图片，并且设置图片的填充方式

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
        child: Image.network(
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3963453026,374513604&fm=26&gp=0.jpg",
          alignment: Alignment.topCenter,
          color: Colors.deepOrangeAccent,
          colorBlendMode: BlendMode.multiply,
          // fit: BoxFit.cover,
          repeat: ImageRepeat.repeat,
        ),
        width: 300,
        height: 300,
        decoration: BoxDecoration(color: Colors.deepOrangeAccent),
      ),
    );
  }
}
