import 'package:flutter/material.dart';
import 'package:flutter_app/forNow21_FloatingActionButton/pages/tabs/Home.dart';
import 'package:flutter_app/forNow21_FloatingActionButton/pages/tabs/Category.dart';
import 'package:flutter_app/forNow21_FloatingActionButton/pages/tabs/Settings.dart';
import 'package:flutter_app/forNow21_FloatingActionButton/pages/tabs/Message.dart';
import 'package:flutter_app/forNow21_FloatingActionButton/pages/tabs/GoOut.dart';

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
    GoOutPage(),
    MessagePage(),
    SettingPage(),
  ];

  _TabsState(index) {
    this._currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Flutter Demo',
      //   ),
      //   // centerTitle: true,
      // ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: this._currentIndex == 2 ? Colors.white : Colors.black,
            size: 32,
          ),
          backgroundColor: this._currentIndex == 2
              ? Theme.of(context).accentColor
              : Colors.yellow,
          onPressed: () {
            print('FloatingActionButton tabs');
            setState(() {
              this._currentIndex = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "闲鱼"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "鱼塘"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "发布"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的"),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  // child: DrawerHeader(
                  //   child: Text('你好！'),
                  //   decoration: BoxDecoration(
                  //     // color: Theme.of(context).accentColor,
                  //     image: DecorationImage(
                  //       image: NetworkImage(
                  //           'https://www.itying.com/images/flutter/2.png'),
                  //       // 加载NetworkImage的时候，记得给手机联网
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  //**********上面是普通的侧边栏头部****************************//
                  //**********下面是用专门的组件进行编写的**********************//
                  child: UserAccountsDrawerHeader(
                    accountName: Text('帅么么'),
                    accountEmail: Text('614xxx891@qq.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/2.png'),
                    ),
                    onDetailsPressed: (){
                      print('啊，你点到我了');
                    },
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.itying.com/images/flutter/3.png'),
                            fit: BoxFit.cover)),
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
