import 'package:flutter/material.dart';
import 'package:flutter_app/forNow19_Drawer/pages/tabs/Home.dart';
import 'package:flutter_app/forNow19_Drawer/pages/tabs/Category.dart';
import 'package:flutter_app/forNow19_Drawer/pages/tabs/Settings.dart';

// 简单介绍了侧边栏的使用方式
// 使用DrawerHeader对侧边栏的头部进行装饰

class Tabs extends StatefulWidget {
  final index;

  const Tabs({Key key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];

  _TabsState(index) {
    this._currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Demo',
        ),
        // centerTitle: true,
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
        iconSize: 24.0,
        // icon的大小
        fixedColor: Theme.of(context).accentColor,
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
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    child: Text('你好！'),
                    decoration: BoxDecoration(
                      // color: Theme.of(context).accentColor,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.itying.com/images/flutter/2.png'),
                        // 加载NetworkImage的时候，记得给手机联网
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text('我的控件'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text('用户中心'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置'),
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右边的导航栏'),
      ),
    );
  }
}
