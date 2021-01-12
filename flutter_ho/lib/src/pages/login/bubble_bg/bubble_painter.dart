import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ho/src/pages/login/bubble_bg/bubble_bean.dart';

class CustomMyPainter extends CustomPainter {
  // 创建画笔实例
  Paint _paint = Paint();

  // 保存气泡bean的list
  List<BubbleBean> list;

  // 随机数，用于计算气泡的半径、速度、角度等
  Random random;

  CustomMyPainter({this.list, this.random});

  // 计算每个气泡的位置
  Offset calculateXY(double speed, double theta) {
    return Offset(speed * cos(theta), speed * sin(theta));
  }

  @override
  void paint(Canvas canvas, Size size) {
    //每次绘制都重新计算位置
    list.forEach((element) {
      //计算偏移
      var velocity = calculateXY(element.speed, element.theta);
      // 新的坐标 微偏移
      var dx = element.position.dx + velocity.dx;
      var dy = element.position.dy + velocity.dy;
      // x轴边界计算
      if (element.position.dx < 0 || element.position.dx > size.width) {
        dx = random.nextDouble() * size.width;
      }

      // y轴边界计算
      if (element.position.dy < 0 || element.position.dy > size.height) {
        dy = random.nextDouble() * size.height;
      }

      //新的位置
      element.position = Offset(dx, dy); // 一开始漏了这句，导致圆的坐标不会实时变化了。。
    });

    //循环绘制所有的气泡
    list.forEach((element) {
      //画笔颜色
      _paint.color = element.color;
      //绘制圆
      canvas.drawCircle(element.position, element.radius, _paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
