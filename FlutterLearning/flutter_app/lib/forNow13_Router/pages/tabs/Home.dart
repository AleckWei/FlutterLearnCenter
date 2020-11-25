import 'package:flutter/material.dart';
import 'package:flutter_app/forNow13_Router/pages/Search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('这里是首页的组件'),
        SizedBox(height: 20),
        RaisedButton(
          onPressed: () {
            print('点击了搜索跳转页面');
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SearchPage();
            }));
          },
          child: Text('跳转到搜索页面'),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(height: 20),

      ],
    );
  }
}
