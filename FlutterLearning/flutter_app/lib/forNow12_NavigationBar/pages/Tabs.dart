import 'package:flutter/material.dart';
import 'package:flutter_app/forNow12_NavigationBar/pages/tabs/Home.dart';
import 'package:flutter_app/forNow12_NavigationBar/pages/tabs/Category.dart';
import 'package:flutter_app/forNow12_NavigationBar/pages/tabs/Settings.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Demo',
        ),
        centerTitle: true,
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        // 下标从0开始，1表示默认选中第2个
        onTap: (int index) {
          // print('选中的下标：' + index.toString());
          setState(() {
            this._currentIndex = index; // 这段就是动态改变选中的图标
          });
        },
        iconSize: 36.0,
        // icon的大小
        fixedColor: Colors.deepPurpleAccent,
        // 表示选中的图标的颜色
        type: BottomNavigationBarType.fixed,
        // 配置底部taps可以有多个按钮,如果没有这个配置,
        // 当items配置的数量过多时,剩余的图标会只剩被选中的那个。
        // 而且点击其他位置会报错,主要是因为上面那个_pageList只配置了3个
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
        ],
      ),
    );
  }
}
