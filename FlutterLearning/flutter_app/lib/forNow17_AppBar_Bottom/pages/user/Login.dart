import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('这是一个登录页面,点击登录会执行登录操作'),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('立即登录')),
          ],
        ),
      ),
    );
  }
}
