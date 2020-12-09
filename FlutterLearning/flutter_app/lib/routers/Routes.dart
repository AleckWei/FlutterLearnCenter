import 'package:flutter/material.dart';

import 'package:flutter_app/forNow25_Dialog//pages/Tabs.dart';
// import 'package:flutter_app/forNow19_Drawer/pages/Tabs2.dart';

// import 'package:flutter_app/forNow19_Drawer/pages/Form.dart';
// import 'package:flutter_app/forNow19_Drawer/pages/Search.dart';
// import 'package:flutter_app/forNow19_Drawer/pages/Product.dart';
// import 'package:flutter_app/forNow19_Drawer/pages/ProductInfo.dart';

// import 'package:flutter_app/forNow19_Drawer/pages/user/Login.dart';
// import 'package:flutter_app/forNow19_Drawer/pages/user/RegisterFirst.dart';
// import 'package:flutter_app/forNow19_Drawer/pages/user/RegisterSecond.dart';
// import 'package:flutter_app/forNow19_Drawer/pages/user/RegisterThird.dart';
//
// import 'package:flutter_app/forNow19_Drawer/pages/AppBarDemo.dart';
// import 'package:flutter_app/forNow19_Drawer/pages/AppBarDemo2.dart';

// import 'package:flutter_app/forNow19_Drawer/pages/TabBarController.dart';

// import 'package:flutter_app/forNow19_Drawer/pages/User.dart';
// import 'package:flutter_app/forNow22_From/pages/Button.dart';
// import 'package:flutter_app/forNow22_From/pages/CheckBox.dart';
// import 'package:flutter_app/forNow22_From/pages/Radio.dart';
// import 'package:flutter_app/forNow22_From/pages/TextField.dart';
// import 'package:flutter_app/forNow22_From/pages/FromDemo.dart';

// 第三方时间组件
import 'package:flutter_app/forNow23_Date/pages/DataPicker.dart';
import 'package:flutter_app/forNow23_Date/pages/DatePickerPub.dart';

// Swiper轮播组件
import 'package:flutter_app/forNow25_Dialog/pages/Swiper.dart';

// 故障码计算
import 'package:flutter_app/forNow24_Swiper/pages/Count.dart';

// Dialog演示
import 'package:flutter_app/forNow25_Dialog/pages/Dialog.dart';

// router文件请记得更新到你想要运行的包

// 配置路由
final routes = {
  // 跟vue一样,在根组件下统一管理路由
  '/': (context, {arguments}) => Tabs(),
  // '/form': (context, {arguments}) => FormPage(arguments: arguments),
  // '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  // '/product': (context, {arguments}) => Product(),
  // '/productInfo': (context, {arguments}) =>
  //     ProductInfoPage(arguments: arguments),

  // 用户登录和注册的页面
  // '/login': (context) => LoginPage(),
  // '/registerFirst': (context) => RegisterFirstPage(),
  // '/registerSecond': (context) => RegisterSecondPage(),
  // '/registerThird': (context) => RegisterThirdPage(),

  // 自定义appBar：
  // '/appBarDemo': (context) => AppBarDemoPage(),
  // '/appBarDemo2': (context) => AppBarDemoPage2(),

  // 顶部TabBar：
  // '/tabBarController': (context) => TabBarControllerPage(),
  // '/userPage': (context) => UserPage(),
  // '/buttonDemoPage': (context) => ButtonDemoPage(),
  // '/textFieldDemoPage': (context) => TextFieldDemoPage(),
  // '/checkBoxDemoPage': (context) => CheckBoxDemoPage(),
  // '/radioDemoPage': (context) => RadioDemoPage(),

  // 表单组件
  // '/fromDemoPage': (context) => FormDemoPage(),

  // 原生&第三方 时间组件
  '/datePickerDemo': (context) => DatePickerDemo(),
  '/datePickerPubDemo': (context) => DatePickerPubDemo(),

  // Swiper轮播图组件
  '/swiperPage': (context) => SwiperPage(),

  // 故障计算
  '/countPage': (context) => CounterPage(),

  // Dialog演示
  '/dialogPage': (context) => DialogPage(),
};

// 固定写法
// ignore: missing_return
// ignore: top_level_function_literal_block, missing_return
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
