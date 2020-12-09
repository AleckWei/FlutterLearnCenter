import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

class HttpDemoPage extends StatefulWidget {
  @override
  _HttpDemoPageState createState() => _HttpDemoPageState();
}

class _HttpDemoPageState extends State<HttpDemoPage> {
  // http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1

  List _list = [];

  _getData() async {
    var url =
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";
    Response response = await Dio().get(url);
    // print(response);
    print(response.data is Map);
    print(json.decode(response.data)["result"]);
    setState(() {
      this._list = json.decode(response.data)["result"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
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
