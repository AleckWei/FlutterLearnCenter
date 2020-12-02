import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/buttonDemoPage');
          // print('无事发生');
        },
        child: Text('点击跳转到按钮演示页面'),
      ),
    );
  }
}
