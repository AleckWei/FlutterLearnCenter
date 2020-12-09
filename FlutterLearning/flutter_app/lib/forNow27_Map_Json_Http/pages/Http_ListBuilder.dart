import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Http2DemoPage extends StatefulWidget {
  @override
  _Http2DemoPageState createState() => _Http2DemoPageState();
}

class _Http2DemoPageState extends State<Http2DemoPage> {
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
          ? ListView.builder(
              itemCount: this._list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${this._list[index]["title"]}'),
                );
              })
          : Text('加载中。。。'),
    );
  }
}
