import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/home/home_art_list_item.dart';

class HomeItem3Page extends StatefulWidget {
  @override
  _HomeItem3PageState createState() => _HomeItem3PageState();
}

class _HomeItem3PageState extends State<HomeItem3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的文章列表"),
      ),
      backgroundColor: Color(0xffCDDEEC),
      // 懒加载
      body: ListView.builder(
        // 列表的个数
        itemCount: 120,
        // 列表的子item的样式
        itemBuilder: (BuildContext context, int index) {
          return HomeItemArtWidget();
        },
      ),
    );
  }
}
