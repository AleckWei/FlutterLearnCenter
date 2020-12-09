import 'package:flutter/material.dart';
import 'package:flutter_app/forNow26_Dialog_Self/components/MyDialog.dart';
import 'package:flutter_app/forNow26_Dialog_Self/components/MyTimerDialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/swiperPage');
            },
            child: Text('swiper轮播图'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/dialogPage');
            },
            child: Text('前往dialog页面'),
          ),
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (builder) {
                    return MyDialog(title: '你好', content: '你好你好~');
                  });
            },
            child: Text('展示自定义dialog页面'),
          ),
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (builder) {
                    return MyTimerDialog(title: '你好', content: '这里是会自己关闭的弹窗~');
                  });
            },
            child: Text('展示自定义定时dialog页面'),
          ),
        ],
      ),
    );
  }
}
