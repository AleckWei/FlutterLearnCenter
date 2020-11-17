main(List<String> args) {
  var s = new Set();
  s.add(111);
  s.add('wwj');
  s.add(28.111);

  s.add('wwj');
  print(s);
  // set不能添加重复的元素

  var sList = s.toList();
  print(sList);
  sList.add('wwj');
  print(sList);  
  // list可以添加重复的元素


  // 利用set不保存重复数据的特性，
  // 快速地做到去重的操作
  var myList = ['香蕉', 'aaa', '西瓜', '橘子', '西瓜', '橘子', '西瓜', '橘子'];
  var set1 = new Set();
  set1.addAll(myList);
  print(set1);
}