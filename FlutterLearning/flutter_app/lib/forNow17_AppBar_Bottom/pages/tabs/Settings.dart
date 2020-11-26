import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text('我是个文本')),
        ListTile(title: Text('我是个文本')),
        ListTile(title: Text('我是个文本')),
        ListTile(title: Text('我是个文本')),
        RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text('跳转到登录界面')),
        RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/registerFirst');
            },
            child: Text('跳转到注册界面'))
      ],
    );
  }
}
