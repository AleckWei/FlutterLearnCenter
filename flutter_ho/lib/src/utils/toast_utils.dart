import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast(String msg) {
    // 根据消息长度决定自动消失时间
    double multiplier = 0.5;
    double flag = msg.length * 0.06 + 0.5;

    // 计算显示的时间
    int timeInSecForIos = (multiplier * flag).round();

    // 如果之前有一个toast，就先关掉
    Fluttertoast.cancel();

    // 显示这个toast
    Fluttertoast.showToast(
      // 弹窗信息
      msg: msg,
      // 弹出的背景颜色
      backgroundColor: Colors.black54,
      // 弹出的窗处于窗口的哪个位置（正中）
      gravity: ToastGravity.BOTTOM,
      // 只针对ios生效的消失时间
      timeInSecForIosWeb: timeInSecForIos,
    );
  }
}
