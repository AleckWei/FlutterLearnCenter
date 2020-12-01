import 'package:flutter/material.dart';
import 'package:flutter_app/forNow19_Drawer/pages/tabs/Home.dart';
import 'package:flutter_app/forNow19_Drawer/pages/tabs/Category.dart';
import 'package:flutter_app/forNow19_Drawer/pages/tabs/Settings.dart';

class Tabs2 extends StatefulWidget {
  final index;

  const Tabs2({Key key, this.index = 0}) : super(key: key);

  @override
  _Tabs2State createState() => _Tabs2State(this.index);
}

class _Tabs2State extends State<Tabs2> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];

  _Tabs2State(index) {
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
                  child: UserAccountsDrawerHeader(
                    accountName: Text('帅么么'),
                    accountEmail: Text('614xxx891@qq.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/3.png'),
                    ),
                    otherAccountsPictures: [
                      // 好像只能显示3个，再多就显示不了了
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.itying.com/images/flutter/5.png')),
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.itying.com/images/flutter/6.png')),
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.itying.com/images/flutter/7.png')),
                    ],
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
              onTap: () {
                Navigator.of(context).pop(); // 侧边栏也相当于一个路由，这样弹出就能隐藏这个侧边栏了
                Navigator.of(context).pushNamed('/userPage');
              },
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
