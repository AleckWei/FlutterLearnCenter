import 'package:flutter/material.dart';

class RegisterSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第二步-验证码')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('输入验证码完成操作'),
            SizedBox(height: 40),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/registerThird');
                  // Navigator.of(context).pushReplacementNamed('/registerThird');
                },
                child: Text('下一步')),
          ],
        ),
      ),
    );
  }
}
