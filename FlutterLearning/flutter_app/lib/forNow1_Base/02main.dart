import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

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
    return Center(
      child: Container(
        child: Text(
          '老师好，我是w同学。'
          '老师好，我是w同学。'
          '老师好，我是w同学。'
          '老师好，我是w同学。'
          '老师好，我是w同学。'
          '老师好，我是w同学。'
          '老师好，我是w同学。'
          '老师好，我是w同学。'
          '老师好，我是w同学。'
          '老师好，我是w同学。',
          // 这个text中的文字内容
          textAlign: TextAlign.left,
          // 文字左对齐(调整参数可以实现右对齐和居中对齐)
          overflow: TextOverflow.ellipsis,
          // 当文字超出可以显示的范围的时候，以各种方式表示后面还有文字
          maxLines: 5,
          // 可以显示的最大的行数
          textScaleFactor: 1.2,
          // 字体放大的倍率
          style: TextStyle(
              fontSize: 20.0,
              // 字体大小
              color: Colors.white,
              // 字体颜色
              fontWeight: FontWeight.w800,
              // 字体粗细
              fontStyle: FontStyle.italic,
              // 字体倾斜
              decoration: TextDecoration.underline,
              // 字体的划线（上划线，下划线，中间划线）
              decorationColor: Colors.tealAccent,
              // 划线的颜色
              decorationStyle: TextDecorationStyle.dashed,
              // 划线的样式（这里是比虚线长一点的断线）
              letterSpacing: 5.0 // 字间距
              ),
          // 这里来设定文字的样式，跟css的类似
        ),
        // child是container内部可以包含的东西，
        // 这里的demo是塞了一个Text进去
        height: 300.0,
        //高度300
        width: 300.0,
        //宽度300
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          border: Border.all(
            color: Colors.blue,
            width: 4.0,
          ),
          borderRadius: BorderRadius.all(
            // Radius.circular(150),// 这样写出来是圆形
            Radius.circular(20),
          ),
        ),
        // 对container的装饰，可以对当中的背景颜色
        // 边框等做修改,如果设定圆角为150的话，就是一个圆了

        // padding: EdgeInsets.fromLTRB(10, 30, 5, 0), // container内容相对边框的距离
        // margin: EdgeInsets.fromLTRB(10, 30, 5, 0),  // container边框相对外部的距离
        // transform: Matrix4.translationValues(100, 0, 0), // container相对于外部元素的偏移量
        // transform: Matrix4.rotationY(1),  //rotationX(Y,Z),以某个轴作旋转。转入的value会让它转多少需要研究下
        // transform: Matrix4.diagonal3Values(0.5, 2, 13), // 将container的X,Y,Z三个方向上的边依据传入的value进行伸缩
        alignment: Alignment.center, // 将container里面的内容依据这个标准进行对齐
      ),
    );
  }
}
