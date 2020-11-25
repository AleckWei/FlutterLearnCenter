import 'package:flutter/material.dart';
// import 'package:flutter_app/forNow14_HaveNameRouter/pages/Search.dart';

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
            Navigator.pushNamed(context, '/search',arguments: {});
            // 命名路由的实现
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
