import 'package:flutter/material.dart';

class RegisterThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第三步-完成注册')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('输入密码完成注册：'),
            SizedBox(height: 40),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('确定')),
          ],
        ),
      ),
    );
  }
}
