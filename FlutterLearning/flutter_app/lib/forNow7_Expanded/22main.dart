import 'package:flutter/material.dart';
import '../res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// 对伸缩组件Expanded进行一个介绍以及属性的详解

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
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: <Widget>[
            //在Row当中,配置了Expanded的组件，它的width将被自动适应,手动修改不了
            IconContainer(Icons.star, color: Colors.limeAccent),
            Expanded(
                child: IconContainer(Icons.home, color: Colors.black54),
                flex: 1),
            // 这样就可以让右侧的图标自动填充剩余的Row
            // Expanded(
            //     child: IconContainer(Icons.search, color: Colors.orangeAccent),
            //     flex: 1),
          ],
        ),
        Row(
          children: <Widget>[
            //在Row当中,配置了Expanded的组件，它的width将被自动适应,手动修改不了
            Expanded(
                child: IconContainer(Icons.star, color: Colors.limeAccent),
                flex: 1),
            Expanded(
                child: IconContainer(Icons.home, color: Colors.black54),
                flex: 2),
            Expanded(
                child: IconContainer(Icons.search, color: Colors.orangeAccent),
                flex: 1),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class IconContainer extends StatelessWidget {
  double size = 32.0;
  Color color = Colors.redAccent;
  IconData icon;

  IconContainer(this.icon, {this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: this.color,
      ),
    );
  }
}
