import 'package:flutter/material.dart';

import 'package:flutter_app/forNow17_AppBar_Bottom/pages/Tabs.dart';
import 'package:flutter_app/forNow17_AppBar_Bottom/pages/Form.dart';
import 'package:flutter_app/forNow17_AppBar_Bottom/pages/Search.dart';
import 'package:flutter_app/forNow17_AppBar_Bottom/pages/Product.dart';
import 'package:flutter_app/forNow17_AppBar_Bottom/pages/ProductInfo.dart';

import 'package:flutter_app/forNow17_AppBar_Bottom/pages/user/Login.dart';
import 'package:flutter_app/forNow17_AppBar_Bottom/pages/user/RegisterFirst.dart';
import 'package:flutter_app/forNow17_AppBar_Bottom/pages/user/RegisterSecond.dart';
import 'package:flutter_app/forNow17_AppBar_Bottom/pages/user/RegisterThird.dart';

import 'package:flutter_app/forNow17_AppBar_Bottom/pages/AppBarDemo.dart';
import 'package:flutter_app/forNow17_AppBar_Bottom/pages/AppBarDemo2.dart';
// router文件请记得更新到你想要运行的包

// 配置路由
final routes = {
  // 跟vue一样,在根组件下统一管理路由
  '/': (context, {arguments}) => Tabs(),
  '/form': (context, {arguments}) => FormPage(arguments: arguments),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  '/product': (context, {arguments}) => Product(),
  '/productInfo': (context, {arguments}) => ProductInfoPage(arguments: arguments),
  
  // 用户登录和注册的页面
  '/login': (context) => LoginPage(),
  '/registerFirst': (context) => RegisterFirstPage(),
  '/registerSecond': (context) => RegisterSecondPage(),
  '/registerThird': (context) => RegisterThirdPage(),
  
  // 自定义appBar：
  '/appBarDemo':(context) => AppBarDemoPage(),
   '/appBarDemo2':(context) => AppBarDemoPage2(),
};

// 固定写法
// ignore: missing_return
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  // print('路由的名称name:' + name);
  final Function pageContentBuilder = routes[name];
  // print("this.routes[name]:" + this.routes[name].toString());

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      // print('有参数!参数是:' + settings.arguments.toString());
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      // print('没有参数');
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
