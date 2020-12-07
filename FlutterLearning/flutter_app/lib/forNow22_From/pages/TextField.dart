import 'package:flutter/material.dart';

class TextFieldDemoPage extends StatefulWidget {
  @override
  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  var _username = new TextEditingController();
  var _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._username.text = '帅么么';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单演示页面'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            // TextDemo(),
            // 以上为各种表单的用法
            // 下面这个为获取表单当中的数据
            TextField(
              decoration: InputDecoration(
                hintText: '请输入用户名',
              ),
              controller: this._username,
              onChanged: (value) {
                setState(() {
                  this._username.text = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: '请输入密码',
              ),
              // controller: this._username,
              onChanged: (value) {
                setState(() {
                  this._password = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                child: Text('登录'),
                onPressed: () {
                  print(this._username.text);
                  print(this._password);
                },
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: '请输入搜索内容',
            border: OutlineInputBorder(), // 这个就是给输入框加上边框
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: '多行文本框',
            border: OutlineInputBorder(), // 这个就是给输入框加上边框
          ),
          maxLines: 4, // 最大显示行数（默认是1）
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: '密码框',
            border: OutlineInputBorder(), // 这个就是给输入框加上边框
          ),
          obscureText: true, // 设置为保密属性
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: '用户名',
            // label不同于hindText，这个在用户输入的时候会缩到左上角，变成输入框的标签
            border: OutlineInputBorder(), // 这个就是给输入框加上边框
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: '密码',
            border: OutlineInputBorder(), // 这个就是给输入框加上边框
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            // icon: Icon(Icons.people), // 在输入框的外面
            prefixIcon: Icon(Icons.people), // 在输入框的里面
            // 个人比较喜欢图标在里面的效果
            hintText: '请输入用户名',
            border: OutlineInputBorder(), // 这个就是给输入框加上边框
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            // icon: Icon(Icons.people), // 在输入框的外面
            prefixIcon: Icon(Icons.message), // 在输入框的里面
            // 个人比较喜欢图标在里面的效果
            hintText: '请输入密码',
            border: OutlineInputBorder(), // 这个就是给输入框加上边框
          ),
          obscureText: true,
        )
      ],
    );
  }
}
