main(List<String> args) {
  /**
   * 映射(Maps)是无需的键值对:
   *  常用属性：
   *    keys            获取所有的key的值
   *    values          获取所有的value的值
   *    isEmpty         是否为空
   *    isNotEmpty      是否不为空
   *  
   *  常用方法：
   *    remove(key)     删除指定的key的数据
   *    addAll({...})   合并映射  给映射内增加属性
   *    containsValue   查看映射内的值 返回true/false
   *    forEach
   *    map
   *    where
   *    any
   *    every
   */

  var person = {
    "name" : "wwj",
    "age" : 20
  };

  var m = new Map();
  m['name'] = 'wwj2';

  print(person);
  print(person.keys.toList());
  print(person.values.toList());

  person.addAll({
    "work":["敲代码","送外卖"],
    "height":178
  });
  print(person['work'].toList());

  print(m);



}