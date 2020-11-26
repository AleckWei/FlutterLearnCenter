import 'package:flutter/material.dart';
import 'package:flutter_app/forNow16_ReturnRoot/pages/Tabs.dart';

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
                  // Navigator.of(context).pop();
                  // 如果前面的路由跳转使用的是push而不是replace的时候
                  // 这个pop就会返回到第二步了

                  // 下面就是直接返回根的方法：
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(builder: (context) => new Tabs(index:2)),
                      // 如果是直接调用Tabs()的话，默认是返回下标为0的页面
                      (route) => route == null);
                },
                child: Text('确定')),
          ],
        ),
      ),
    );
  }
}
