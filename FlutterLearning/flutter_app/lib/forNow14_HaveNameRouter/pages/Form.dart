import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormPage extends StatelessWidget {
  List list = new List();
  String title = '表单';

  FormPage({this.title = '表单页面'}) {
    for (var i = 1; i <= 20; i++) {
      this.list.add(Text('这是第$i个表单'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // 这是一个浮动按钮
        child: Text('返回'),
        onPressed: () {
          Navigator.of(context).pop();
          // 返回上一个页面
        },
      ),
      appBar: AppBar(title: Text(this.title)),
      body: ListView(
        children: this
            .list
            .map((e) => ListTile(title: e, subtitle: Text('无限套娃')))
            .toList(),
      ),
    );
  }
}
