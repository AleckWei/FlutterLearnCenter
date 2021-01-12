import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ho/src/pages/login/bubble_bg/bubble_bean.dart';

class CustomMyPainter extends CustomPainter {
  // 创建画笔实例
  Paint _paint = new Paint();

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
    // TODO: implement paint
    list.forEach((element) {
      // 每次都需要重新计算偏移量
      var velocity = calculateXY(element.speed, element.theta);
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
    });

    list.forEach((element) {
      // 画笔的颜色
      _paint.color = element.color;
      // 画布上画圆
      canvas.drawCircle(element.position, element.radius, _paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // 配置是否可以重复画
    return true;
  }
}
