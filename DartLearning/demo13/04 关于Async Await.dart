/**
 * async 和 await
 *  这两个关键字的使用只需要记住两点：
 *    只有async方法才能使用await关键字调用方法
 *    如果调用async方法必须使用await关键字
 * 
 * async是让方法变成异步
 * 
 * await是等待异步方法执行完成
 * 
 */

main(List<String> args) async{
  var result = await testAsync();
  print(result);
}

testAsync() async*{
  yield await 'Hello async';
}