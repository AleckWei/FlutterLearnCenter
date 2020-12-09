import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpDemoPage extends StatefulWidget {
  @override
  _HttpDemoPageState createState() => _HttpDemoPageState();
}

class _HttpDemoPageState extends State<HttpDemoPage> {
  List _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this._getData();
  }

  _getData() async {
    var url = "http://a.itying.com/api/productlist";
    var res = await http.get(url);

    if (res.statusCode == 200) {
      print(res.body);
      setState(() {
        this._list = json.decode(res.body)["result"];
      });
    } else {
      print("失败！${res.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请求数据Demo'),
      ),
      body: this._list.length > 0
          ? ListView(
              children: this._list.map((value) {
                return ListTile(
                  title: Text(value["title"]),
                  subtitle: Text(value["pid"]),
                );
              }).toList(),
            )
          : Text('加载中。。。'),
    );
  }
}
