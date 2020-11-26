import 'package:flutter/material.dart';
// import 'package:flutter_app/forNow15_RouterReplace/pages/Search.dart';

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
            Navigator.pushNamed(context, '/search', arguments: {"id": 123});
            // 命名路由的实现
          },
          child: Text('跳转到搜索页面'),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(height: 20),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/product');
          },
          child: Text('跳转到商品页面'),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        )
      ],
    );
  }
}
