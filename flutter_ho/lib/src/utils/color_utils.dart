import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils {
  // 获取随机颜色
  static Color getRandomColor() {
    return Color.fromARGB(
      255, // 这里是满透明的
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
    );
  }

  // ignore: non_constant_identifier_names
  static Color getRandomWightColor(Random random) {
    // 生成一个10~200的随机数
    int a = random.nextInt(190) + 10;
    // 生成一个透明度在10~200的白色
    return Color.fromARGB(a, 255, 255, 255);
  }
}
