import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map userInfo;
  String user;

  String _news = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.userInfo = {"username": 'wwj', 'age': 20};

    this.user = '{"username":"zh","age":20}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${this._news}'),
          RaisedButton(
            onPressed: _getData,
            child: Text('Get请求数据'),
          ),
          RaisedButton(
            onPressed: _postData,
            child: Text('Post提交数据'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/httpDemoPage');
            },
            child: Text('Get请求数据，渲染数据演示demo'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/http2DemoPage');
            },
            child: Text('Get请求数据，渲染数据演示demo'),
          ),
          RaisedButton(
            onPressed: () {
              print('encode:');
              var res = json.encode(this.userInfo);
              print(userInfo is Map);
              print(res is String);
              print('++++++++++' + json.encode(userInfo));
              /**
               * 输出的东西：
               * I/flutter (10591): encode:
               * I/flutter (10591): true
               * I/flutter (10591): true
               * I/flutter (10591): ++++++++++{"username":"wwj","age":20}
               */

              print('decode:');
              Map m = json.decode(user);
              print(m["username"]);
              /**
               * 输出：
               * I/flutter (10591): decode:
               * I/flutter (10591): zh
               */
            },
            child: Text('输出一下东西'),
          ),
        ],
      ),
    );
  }

  void _getData() async {
    print('请求开始');
    var url = 'http://192.168.0.5:3000/news'; // 这个是人家的内网的服务，现在肯定是连接不了
    var res = await http.get(url);

    if (res.statusCode == 200) {
      print('请求成功！');
      print(res.body);
      setState(() {
        this._news = json.decode(res.body)["msg"];
      });
    } else {
      print('请求失败:${res.bodyBytes}');
    }
  }

  void _postData() async {
    print('传输开始');
    var url = 'http://192.168.0.5:3000/dologin'; // 这个是人家的内网的服务，现在肯定是连接不了
    var res = await http.post(url, body: {'username': '张三', 'age': '20'});

    if (res.statusCode == 200) {
      print('请求成功！');
      print(res.body);
      setState(() {
        this._news = json.decode(res.body)["msg"];
      });
    } else {
      print('请求失败:${res.bodyBytes}');
    }
  }
}
