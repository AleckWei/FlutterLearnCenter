import 'dart:convert';
import 'dart:io';

import 'src.dart';

String HOST = '172.28.4.154';
int PORT = 8099;

List<String> _queryList = new List();
main(List<String> args) async {
  var requestServer = await HttpServer.bind(HOST, PORT);
  print('服务正在${PORT}端口上运行');
  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGetMethod(request);
    } else if (request.method == 'POST') {
      handlePostMethod(request);
    }
  } catch (e) {
    print('异常！' + e.toString());
  }
}

void handleGetMethod(HttpRequest request) {
  // 在实际开发当中，get主要是对服务器做读操作
  print('get请求收到数据：' + request.uri.toString());

  String request_str = request.uri.toString();
  String interface;
  if (request_str.indexOf('?') != -1) {
    interface = request_str.substring(1, request_str.indexOf('?'));
  } else {
    interface = request_str.substring(1);
  }

  print('接口名称：' + interface);
  String queryParameters = request_str.substring(request_str.indexOf('?') + 1);
  _queryList = [];
  queryParametersPharse(queryParameters);
  print('参数列表' + _queryList.toString());

  String response_res = '{"code" : 404 , "message" : "暂时没有找到资源"}';
  if (interface == 'article') {
    response_res = getArticleMethod(_queryList);
  }

  request.response
    ..write(response_res)
    ..close();
}

void handlePostMethod(HttpRequest request) {
  // 在实际开发当中，post主要是对服务器做写操作
  print('post请求，收到数据：' + request.uri.toString());
  // post请求，收到数据：/login?mobile=13622962185&password=123456

  String request_str = request.uri.toString();
  String interface = request_str.substring(1, request_str.indexOf('?'));
  print('接口名称：' + interface);

  String queryParameters = request_str.substring(request_str.indexOf('?') + 1);
  _queryList = [];
  queryParametersPharse(queryParameters);
  print('参数列表' + _queryList.toString());

  String response_res = '{"code" : 404 , "message" : "暂时没有找到资源"}';
  if (interface == 'login') {
    response_res = doLogin(request_str);
  }

  request.response
    ..write(response_res)
    ..close();
}

String doLogin(String request_str) {
  String key;
  String val;
  Map<String, dynamic> queryMap = new Map();
  _queryList.forEach((element) {
    key = element.substring(0, element.indexOf('='));
    val = element.substring(element.indexOf('=') + 1);
    queryMap[key] = val;
  });

  print('用户名：${queryMap["mobile"]},密码：${queryMap["password"]}');

  String response_res;
  if (queryMap["mobile"] == '13622962185' && queryMap["password"] == '123456') {
    response_res =
        '{"code" : 200,"data" : {"userName" : "wwj" , "age" : 18 },"message":""}';
  } else {
    response_res = '{"code" : 403,"data" : "","message":"账号或者密码有误！"}';
  }
  return response_res;
}

String getArticleMethod(List<String> list) {
  String response_res;
  if (list == null || list.length == 0) {
    response_res = '{"code" : 403,"data" : "","message":"请求参数不全"}';
  } else {
    Map<String, int> queryMap = new Map();
    String key;
    int val;
    list.forEach((element) {
      key = element.substring(0, element.indexOf('='));
      val = (int) element.substring(element.indexOf('=') + 1);
      queryMap[key] = val;
    });
    response_res = '{"code" : 200,"data" : ' +
        json.encode(ListViewData[queryMap[key]]) +
        ',"message":""}';
    // print('回复数据：' + response_res);
  }

  return response_res;
}

void queryParametersPharse(String queryParameters) {
  String queryStr;
  int indexOfEnd = queryParameters.indexOf('&');
  if (indexOfEnd != -1) {
    queryStr = queryParameters.substring(0, indexOfEnd);
    if (queryStr.contains('=')) {
      _queryList.add(queryStr);
    }
    String nextQueryStr = queryParameters.substring(indexOfEnd + 1);
    queryParametersPharse(nextQueryStr);
  } else {
    queryStr = queryParameters;
    if (queryStr.contains('=')) {
      _queryList.add(queryStr);
    }
    return;
  }
}
