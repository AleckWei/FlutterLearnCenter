import 'package:flutter/material.dart';

class AppBarDemoPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 表示顶部可以用于切换的按钮的数量
      child: Scaffold(
        appBar: AppBar(
          // 在这里设置顶部的切换页面的tabBar
          title: Text('AppBarDemoPage2'),
          backgroundColor: Colors.cyan[700],
          bottom: TabBar(tabs: [
            Tab(text: "热门"),
            Tab(text: "推荐"),
          ]),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ListTile(title: Text('第一个Tab')),
                ListTile(title: Text('第一个Tab')),
                ListTile(title: Text('第一个Tab')),
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text('第2个Tab')),
                ListTile(title: Text('第2个Tab')),
                ListTile(title: Text('第2个Tab')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
