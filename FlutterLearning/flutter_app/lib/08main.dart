import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// 又是手动地添加了一堆屎。。。
// 实现了一个 标题 - 图片 的垂直长列表

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
      padding: EdgeInsets.all(5),
      children: <Widget>[
        Image.network(
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3963453026,374513604&fm=26&gp=0.jpg"),
        Container(
          child: Text(
            '标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
          height: 40,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605784928164&di=3212e6a28b38c3b5e4482f2b29854441&imgtype=0&src=http%3A%2F%2Fp1.qhimgs4.com%2Ft01e1b3e9ba625bb741.gif"),
        Container(
          child: Text(
            '标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
          height: 40,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2819758932,2013724422&fm=26&gp=0.jpg"),
        Container(
          child: Text(
            '标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
          height: 40,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3963453026,374513604&fm=26&gp=0.jpg"),
        Container(
          child: Text(
            '标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
          height: 40,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605784928164&di=3212e6a28b38c3b5e4482f2b29854441&imgtype=0&src=http%3A%2F%2Fp1.qhimgs4.com%2Ft01e1b3e9ba625bb741.gif"),
        Container(
          child: Text(
            '标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
          height: 40,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2819758932,2013724422&fm=26&gp=0.jpg"),
        Container(
          child: Text(
            '标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
          height: 40,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3963453026,374513604&fm=26&gp=0.jpg"),
      ],
    );
  }
}
