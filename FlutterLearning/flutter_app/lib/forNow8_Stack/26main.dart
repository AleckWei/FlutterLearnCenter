import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// Stack的应用,用Align控制其中某个组件相对于外层容器的位置

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
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.orangeAccent,
        child: Stack(
          // alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment(0.2,-0.3),
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.search,
                size: 40,
                color: Colors.red,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.star,
                size: 70,
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                Icons.home,
                size: 50,
                color: Colors.teal,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.height,
                size: 45,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
