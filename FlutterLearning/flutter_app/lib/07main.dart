import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// 一个简单的ListView的实现，手动的本地设置一堆的数据

//自定义组件 == 创建一个类：
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 一般作为app的根组件
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        // 实际上，ListView里面可以放任何的组件
        // 这里为了体现统一就暂时用这个ListTile来充当子数据
        Image.asset('images/a.png',
            color: Colors.deepOrangeAccent, colorBlendMode: BlendMode.multiply),
        ListTile(
          leading: Icon(
            Icons.account_balance_rounded,
            color: Colors.deepOrangeAccent,
            size: 50,
          ),
          title: Text('1这里是title'),
          subtitle: Text('这是一个二级标题'),
          trailing: Icon(Icons.search),
        ),
        ListTile(
          leading: Image.network(
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3963453026,374513604&fm=26&gp=0.jpg",
            width: 45,
            fit: BoxFit.cover,
          ),
          title: Text('2这里是title'),
          subtitle: Text('这是一个二级标题'),
          trailing: Icon(Icons.search),
        ),
        ListTile(
          title: Text('3这里是title'),
          subtitle: Text('这是一个二级标题'),
        ),
        ListTile(
          title: Text('4这里是title'),
          subtitle: Text('这是一个二级标题'),
        ),
        ListTile(
          title: Text('5这里是title'),
          subtitle: Text('这是一个二级标题'),
        ),
        ListTile(
          title: Text('6这里是title'),
          subtitle: Text('这是一个二级标题'),
        ),
        ListTile(
          title: Text('7这里是title'),
          subtitle: Text('这是一个二级标题'),
        ),
      ],
    );
  }
}
