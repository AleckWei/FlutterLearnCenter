import 'package:flutter/material.dart';
import 'package:flutter_app/forNow14_HaveNameRouter/pages/Form.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return FormPage(title: "传了个值过去");
            // }));
            // 普通路由，直接指定页面的类
            Navigator.pushNamed(context, '/form',arguments: {"title":"命名路由的传值"});
            // 命名路由，在根页面配置了路由表之后，其他页面使用这种路由方式可以跳转，并且带一个值过去
          },
          child: Text('跳转到表单页面并传值'),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ],
    );
  }
}
