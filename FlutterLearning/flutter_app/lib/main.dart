import 'package:flutter/material.dart';

// import 'package:flutter_app/res/MyContainer.dart';
// import './res/listData.dart';
import 'package:flutter_app/forNow14_HaveNameRouter/pages/Tabs.dart';
import 'package:flutter_app/forNow14_HaveNameRouter/pages/Form.dart';
import 'package:flutter_app/forNow14_HaveNameRouter/pages/Search.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

void main() {
  runApp(MyApp());
}

// Flutter当中的命名路由

//自定义组件 == 创建一个类：
class MyApp extends StatelessWidget {
  final routes = {
    // 跟vue一样,在根组件下统一管理路由
    '/form': (context) => FormPage(),
    '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 一般作为app的根组件
      home: Tabs(),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        final String name = settings.name;
        print('settings.name:' + settings.name);
        final Function pageContengBuilder = this.routes[name];
        if (pageContengBuilder != null) {
          final Route route = MaterialPageRoute(builder: (context) {
            return pageContengBuilder(context, argument: settings.arguments);
          });
          return route;
        } else {
          final Route route = MaterialPageRoute(builder: (context) {
            return pageContengBuilder(context);
          });
          return route;
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
