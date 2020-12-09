import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTimerDialog extends Dialog {
  String title;
  String content;

  MyTimerDialog({this.title = '', this.content = ''});

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    // 启动定时器
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 200,
          width: 250,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      child: Text('${this.title}'),
                      alignment: Alignment.center,
                    ),
                    Align(
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text(
                  '${this.content}',
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showTimer(context) {
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 3000), (t) {
      // 这里设置3秒后调用这个pop方法，也就是把弹窗关闭
      Navigator.of(context).pop();
      t.cancel(); // 取消定时器, 也可以用timer.cancel()
    });
  }
}
