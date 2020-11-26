import 'package:flutter/material.dart';

class AppBarDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBarDemoPage'),
        backgroundColor: Colors.cyan[700],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('menu!');
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('menu');
              }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print('设置');
              })
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Text('你好flutter！'),
      ),
    );
  }
}
