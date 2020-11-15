import 'package:flutter/material.dart';


class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '这里是title',
        home: Scaffold(
          appBar: new AppBar(
            title: new Text('这是标题'),
          ),
          body: new Center(
            child: new Text(
                'Hello World!', style: new TextStyle(fontSize: 32.0)),
          ),
        )
    );
  }
}
