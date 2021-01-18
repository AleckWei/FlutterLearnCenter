import 'dart:convert';
import 'dart:io';

import 'src.dart';

String HOST = '172.28.4.154';
int PORT = 8099;

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

  String response_res = '{"code" : 404 , "message" : "暂时没有找到资源"}';
  if (interface == 'article') {
    response_res = getArticleMethod();
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

  String response_res = '{"code" : 404 , "message" : "暂时没有找到资源"}';
  if (interface == 'login') {
    response_res = doLogin(request_str);
  }

  request.response
    ..write(response_res)
    ..close();
}

String doLogin(String request_str) {
  String userName = request_str.substring(0, request_str.indexOf('&'));
  String pwd = request_str.substring(request_str.indexOf('&') + 1);

  String userName_str = userName.substring(userName.indexOf('=') + 1);
  String pwd_str = pwd.substring(pwd.indexOf('=') + 1);

  print('用户名：${userName_str},密码：${pwd_str}');

  String response_res;
  if (userName_str == '13622962185' && pwd_str == '123456') {
    response_res =
        '{"code" : 200,"data" : {"userName" : "wwj" , "age" : 18 },"message":""}';
  } else {
    response_res = '{"code" : 403,"data" : "","message":"账号或者密码有误！"}';
  }

  return response_res;
}

String getArticleMethod() {
  String response_res =
      '{"code" : 200,"data" : ' + json.encode(ListViewData) + ',"message":""}';
  print('回复数据：' + response_res);
  return response_res;
}
