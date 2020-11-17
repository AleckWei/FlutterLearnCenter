main(List<String> args) {
  /**
   * Dart数据类型： Maps(字典)
   */


  // 1.第一种定义maps的方式
  var person={
    "name" : "wwj",
    "age" : 22,
    "work": ['程序员','送外卖的']
  };

  print(person);
  print(person['name']);
  print(person['age']);
  // print(person.name); 
  //The getter 'name' isn't defined for the class 'Map<String, Object>'.
  print(person['work']);
  // var workList = person['work'];
  // print(workList);
  // print(workList[0]);
  // print(workList[1]);
  // 如果是这种定义方式的话，取不出list里面的东西

  // 2.第二种定义方式
  var p = new Map();
  p['name'] = 'wwj';
  p['work'] = ['程序','送外卖的'];
  var work = p['work'];
  print(p['work'][1]);
  print(work[0]);
}