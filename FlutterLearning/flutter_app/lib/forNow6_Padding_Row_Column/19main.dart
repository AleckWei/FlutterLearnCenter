import 'package:flutter/material.dart';
import '../res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// 这里自定义了一个按钮组件

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
    return IconContainer(Icons.home,color: Colors.black54,);
  }
}

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
