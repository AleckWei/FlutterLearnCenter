import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello World2',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
          color: Colors.white,
        ),
        title: Text('样例标题'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null
          ),
        ],
      ),
      body: Center(
        child: Text('Hello World'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: '添加',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

