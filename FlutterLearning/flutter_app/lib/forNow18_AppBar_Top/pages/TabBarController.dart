import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(vsync: this, length: 3);
    // 初始化这个Controller
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarControllerPage"),
        bottom: TabBar(
          controller: this._tabController,
          tabs: [
            Tab(text: ('热销')),
            Tab(text: ('男装')),
            Tab(text: ('女装')),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: [
          Center(child: Text('热销')),
          Center(child: Text('男装')),
          Center(child: Text('女装')),
        ],
      ),
    );
  }
}
