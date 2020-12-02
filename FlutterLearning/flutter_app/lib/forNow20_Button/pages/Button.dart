import 'package:flutter/material.dart';

class ButtonDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮演示页面'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  print('普通按钮');
                },
                child: Text('普通按钮'),
              ),
              SizedBox(width: 10),
              RaisedButton(
                onPressed: () {
                  print('带颜色的按钮');
                },
                child: Text('带颜色的按钮'),
                color: Colors.lightBlueAccent,
                textColor: Colors.white60,
              ),
              SizedBox(width: 10),
              RaisedButton(
                onPressed: () {
                  print('有阴影的按钮');
                },
                child: Text('有阴影的按钮'),
                elevation: 15.0,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  onPressed: () {
                    print('设置有宽高的按钮');
                  },
                  child: Text('设置有宽高的按钮'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
