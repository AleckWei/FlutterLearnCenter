import 'package:flutter/material.dart';

// import 'package:flutter_app/res/MyContainer.dart';
// import './res/listData.dart';
// import 'package:flutter_app/forNow14_HaveNameRouter/pages/Tabs.dart';
import 'package:flutter_app/routers/Routes.dart';
// import 'package:flutter_app/forNow14_HaveNameRouter/pages/Form.dart';
// import 'package:flutter_app/forNow14_HaveNameRouter/pages/Search.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

void main() {
  runApp(MyApp());
}

// Flutter当中的命名路由，对路由进行抽离，使用命名路由的方式配置传参的路由
// 感觉学到这里就能动手修改黎工的help_center了。哈哈哈

//自定义组件 == 创建一个类：
class MyApp extends StatelessWidget {
  // final routes = {
  //   // 跟vue一样,在根组件下统一管理路由
  //   '/form': (context, {arguments}) => FormPage(arguments: arguments),
  //   '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  // };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 一般作为app的根组件
      // home: Tabs(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // 初始化时需要加载的路由
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
