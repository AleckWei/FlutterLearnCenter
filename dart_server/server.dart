import 'dart:io';

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
  print('收到get请求1 ' + request.uri.data.toString());
  print('收到数据：' + request.uri.toString());
}

void handlePostMethod(HttpRequest request) {
  print('收到post请求1 ' + request.response.toString());
  request.response
    ..statusCode = HttpStatus.ok
    ..write({"success": true})
    ..close();
}
