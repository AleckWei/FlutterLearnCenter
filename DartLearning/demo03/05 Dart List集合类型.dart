/**
 * Dart数据类型：List(数据/集合)
 */

main(List<String> args) {
  // 1.第一种定义List的方式
  var l1 = ['aaa','bbb','ccc'];
  print(l1);
  print(l1.length);
  print(l1[1]);
  l1.add('ddd');
  print(l1);

  // 2.第二种定义list的方式
  var l2 = new List();
  l2.add('张三');
  l2.add('李四');

  // 3.定义list指定类型
  var l3 = new List<String>();
  l3.add('王五');
  // l3.add(123);
  // The argument type 'int' can't be assigned to the parameter type 'String'.
  print(l3);
}