import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/login/bubble_bg/bubble_bean.dart';
import 'package:flutter_ho/src/pages/login/bubble_bg/bubble_painter.dart';
import 'package:flutter_ho/src/utils/color_utils.dart';

class BubbleWidget extends StatefulWidget {
  @override
  _BubbleWidgetState createState() => _BubbleWidgetState();
}

class _BubbleWidgetState extends State<BubbleWidget>
    with SingleTickerProviderStateMixin {
  List<BubbleBean> _list = [];

  Random _random = new Random(DateTime.now().microsecondsSinceEpoch);

  // 气泡的最大半径
  double maxRadius = 100;

  // 气泡动画的最大速度
  double maxSpeed = 0.7;

  // 气泡的最大弧度
  double maxTheta = 2.0 * pi;

  // 动画控制器
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < 20; i++) {
      BubbleBean bean = new BubbleBean();
      // 设置气泡颜色，随机透明的白色
      bean.color = ColorUtils.getRandomWightColor(_random);

      // 先指定一个位置，后面动态随机生成
      bean.position = Offset(-1, -1);

      // 设定随机的运动速度
      bean.speed = _random.nextDouble() * maxSpeed;

      // 设定随机的气泡半径
      bean.radius = _random.nextDouble() * maxRadius;

      // 设定随机的角度
      bean.theta = _random.nextDouble() * maxTheta;

      // 将bean对象保存到集合当中
      _list.add(bean);
    }

    //动画控制器
    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    //刷新监听
    _animationController.addListener(() {
      //流更新
      setState(() {});
    });

    Future.delayed(Duration(milliseconds: 200), () {
      _animationController.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
      // 自定义画布
      painter: CustomMyPainter(
        list: _list,
        random: _random,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
