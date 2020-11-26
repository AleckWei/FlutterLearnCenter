import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormPage extends StatelessWidget {
  final arguments; // 注意：如果想要正常的对象 通过key取出value的话，这个arguments最好由final修饰
  List list = new List();
  String title = '表单';

  // FormPage.args({this.arguments});
  FormPage({this.arguments, this.title = '表单页面'}) {
    // 这个title在这里需要传值的话，是必须要给予一个初始值的，不然会有问题
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
      // Text('${arguments != null ? arguments['id'] : '0'}'),
      appBar: AppBar(
        title: Text('${arguments['title']}'),
      ),
      body: ListView(
        children: this
            .list
            .map((e) => ListTile(title: e, subtitle: Text('无限套娃')))
            .toList(),
      ),
    );
  }
}
