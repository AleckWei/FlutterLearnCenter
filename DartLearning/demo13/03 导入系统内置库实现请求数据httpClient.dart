import 'dart:io';
import 'dart:convert';

main(List<String> args) async {
  var result = await _getDataFromZhihuAPI();
  print(result);
}
// await 和 async 是成双成对出现的

// 知乎接口： http://news-at.zhihu.com/api/3/stories/latest
_getDataFromZhihuAPI() async{
  // 1.创建HttpClient对象
  var httpClient = new HttpClient();
  // 2.创建uri对象
  var url = new Uri.http('news-at.zhihu.com','/api/3/stories/latest');
  // 3.发起请求
  var request = await httpClient.getUrl(url);
  // 4.关闭请求，等待响应
  var response = await request.close();
  // 5.解码响应内容
  return await response.transform(utf8.decoder).join();
}