import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/home/list_item_widget.dart';

class HomeItemPage extends StatefulWidget {
  // 用于标识当前是哪个页面
  final int flag;

  HomeItemPage(this.flag);

  @override
  _HomeItemPageState createState() => _HomeItemPageState();
}

class _HomeItemPageState extends State<HomeItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListViewItemWidget();
        },
      ),
    );
  }
}
