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
          SizedBox(height: 200),
          RaisedButton(
            onPressed: () {
              // Navigator.of(context).pushNamed('/appBarDemo');
              print('无事发生');
            },
            child: Text('转到appBarPage'),
          ),
          SizedBox(width: 10),
          RaisedButton(
            onPressed: () {
              // Navigator.of(context).pushNamed('/tabBarController'),
              print('无事发生');
            },
            child: Text('TabController定义顶部tab切换'),
          ),
        ],
      ),
    );
  }
}
