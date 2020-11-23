import 'package:flutter/material.dart';

// MaterialApp一般作为页面的根组件，用其他的组件在这上面添加
// MaterialApp当中一般又包含一个Scaffold组件，这个组件包含一个头部
// 和一个白色的背景

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
        // 设定app的主体颜色
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // 在页面的中心设定以下内容
      // 实际上页面会让这个Center强行铺满整个页面
      child: Text(
        '你好flutter',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          // color: Colors.yellowAccent,
          color: Color.fromRGBO(234, 233, 121, 0.5),
        ),
      ),
    );
  }
}
