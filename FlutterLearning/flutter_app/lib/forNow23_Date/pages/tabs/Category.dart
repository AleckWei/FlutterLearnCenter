import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white70,
            title: Row(children: [
              Expanded(
                child: TabBar(
                  isScrollable: true, // 是否能滚动，Tab有很多个的时候，字体就会被挤在一次
                  indicatorColor: Colors.amber[900], // 指示器的颜色
                  labelColor: Colors.amber[900], // 这个可以设置其中的字体颜色
                  labelStyle: TextStyle(fontSize: 20, color: Colors.amber[900]),
                  // 也可以指定选中的字体风格，style当中指定不了颜色

                  unselectedLabelColor: Colors.brown[700],
                  unselectedLabelStyle:
                      TextStyle(fontSize: 13, color: Colors.brown[700]),
                  // 未选中的style也是同理，颜色无法在这里指定

                  indicatorSize: TabBarIndicatorSize.label,
                  // tab表示默认值；label表示和当中的字体等宽
                  tabs: [
                    Tab(text: '热销'),
                    Tab(text: '推荐'),
                    Tab(text: '高达'),
                    Tab(text: '11-11'),
                    Tab(text: '时尚'),
                    Tab(text: '男装'),
                    Tab(text: '女装'),
                    Tab(text: '家居'),
                  ],
                ),
              )
            ]),
          ),
          body: TabBarView(children: [
            ListView(
              children: [
                ListTile(title: Text('热销')),
                ListTile(title: Text('热销')),
                ListTile(title: Text('第一个Tab')),
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text('推荐')),
                ListTile(title: Text('第2个Tab')),
                ListTile(title: Text('第2个Tab')),
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text('高达')),
                ListTile(title: Text('第3个Tab')),
                ListTile(title: Text('第3个Tab')),
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text('11-11')),
                ListTile(title: Text('第4个Tab')),
                ListTile(title: Text('第5个Tab')),
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text('时尚')),
                ListTile(title: Text('第5个Tab')),
                ListTile(title: Text('第5个Tab')),
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text('男装')),
                ListTile(title: Text('第6个Tab')),
                ListTile(title: Text('第6个Tab')),
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text('女装')),
                ListTile(title: Text('第7个Tab')),
                ListTile(title: Text('第7个Tab')),
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text('家居')),
                ListTile(title: Text('第8个Tab')),
                ListTile(title: Text('第8个Tab')),
              ],
            ),
          ]),
        ));
  }
}
