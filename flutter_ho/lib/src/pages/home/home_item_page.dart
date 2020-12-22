import 'package:flutter/material.dart';

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
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 100),
          Text('当前页面： ${widget.flag}'),
        ],
      ),
    );
  }
}
