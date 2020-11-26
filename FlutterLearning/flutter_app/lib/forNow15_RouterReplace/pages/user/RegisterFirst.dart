import 'package:flutter/material.dart';

class RegisterFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第一步-输入密码')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('第一步-输入手机号'),
            SizedBox(height: 40),
            RaisedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/registerSecond');
                  // 路由栈的思想，向栈当中添加一个路由，然后栈中的路由对象就多一个
                  Navigator.of(context).pushReplacementNamed('/registerSecond');
                  // 用replace的思想，用第二步的页面把第一步的替换掉
                  // 但是这样会有一个问题，如果在第二步的时候，想修改第一步的信息，
                  // 这样跳路由的话，一返回就重新回到“设置”页面，这样其实不友好
                },
                child: Text('下一步')),
          ],
        ),
      ),
    );
  }
}
