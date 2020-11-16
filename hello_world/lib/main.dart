import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My App',
    home: MyScaffold(),
  ));
}

class MyAppBar extends StatelessWidget {
  // 自定义的头部
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery
        .of(context)
        .padding
        .top;

    return Container(
      height: 56.0 + paddingTop,
      // margin: EdgeInsets.only(top: paddingTop),
      padding: EdgeInsets.only(right: 8.0, left: 8.0, top: paddingTop),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: '导航菜单',
            onPressed: null,
          ),
          Expanded(child: title),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              '样例的标题',
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello World!'),
            ),
          ),
        ],
      ),
    );
  }
}
