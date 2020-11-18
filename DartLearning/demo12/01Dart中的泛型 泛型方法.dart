/**
 * 通俗理解：泛型就是解决 类 接口 方法的复用性、以及对不特定数据类型的支持(类型校验)
 */

// 不指定类型 放弃了类型检查；
// 我们现在想实现的是：传入什么类型，返回的值就是什么类型
T getData<T>(T value){
  return value;
}

main(List<String> args) {
  var str = getData<String>('111');
  print(str);
  print(str is String);

  List list1 = new List<String>();
  list1.add('1');
  // list1.add(2);
  // type 'int' is not a subtype of type 'String' of 'value'
  list1.add('3');
}