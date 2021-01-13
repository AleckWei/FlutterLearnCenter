import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/home/home_item3_page.dart';
import 'package:flutter_ho/src/pages/home/home_item_page.dart';
import 'package:flutter_ho/src/pages/mine/mine_main_page.dart';

// 首页面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 当前选中的下标
  int _currentIndex = 0;
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          // 配置控制器
          controller: _pageController,
          // 不可以左右滑动
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeItemPage(1),
            HomeItemPage(2),
            HomeItem3Page(),
            // 个人中心页面
            MineMainPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 当前选中的标志位
        currentIndex: _currentIndex,
        // 底部点击事件，更新下标
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            // 通过这个pageController去跳转页面
            _pageController.jumpToPage(index);
          });
        },
        // 需要显示文字
        type: BottomNavigationBarType.fixed,
        // 未选中的颜色
        unselectedItemColor: Colors.blue,
        // 选中的颜色
        selectedItemColor: Colors.orangeAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.five_g),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
