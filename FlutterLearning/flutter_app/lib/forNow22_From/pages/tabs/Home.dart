import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/buttonDemoPage');
            },
            child: Text('按钮演示页面'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/textFieldDemoPage');
            },
            child: Text('表单演示页面'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/checkBoxDemoPage');
            },
            child: Text('CheckBox'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/radioDemoPage');
            },
            child: Text('Radio Switch Demo'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/fromDemoPage');
            },
            child: Text('信息登记页'),
          )
        ],
      ),
    );
  }
}
