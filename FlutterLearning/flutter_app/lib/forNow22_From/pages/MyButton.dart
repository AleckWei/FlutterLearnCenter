import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // 自定义一个按钮组件
  final text;
  final perssed;
  final double width;
  final double height;

  const MyButton(
      {this.text = '',
      this.perssed = null,
      this.width = 80,
      this.height = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        onPressed: this.perssed,
        child: Text(this.text),
      ),
    );
  }
}
