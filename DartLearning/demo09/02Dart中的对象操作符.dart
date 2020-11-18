/**
 * Dart中对象的操作符：
 *  ？  条件运算符（了解）
 *  as  类型转换
 *  is  类型判断
 *  ..  级联操作（连缀）
 */

class Person {
  String name;
  num age;
  Person(this.name,this.age);
  void printInfo(){
    print('${this.name} --- ${this.age}');
  }
}

main(List<String> args) {
  Person p;
  p?.printInfo();
  // 如果p只是被声明了，但是没有被实例化
  // 这里相当于p是空的。？表示当p为空的时候，就不执行后面这个printInfo方法。

  Person p1 = new Person('>>>',1);
  if(p1 is Person){
    p1.name = 'wwj';
  }
  p1.printInfo();

  // var p2 = '';
  // p2 = new Person('wwj',13);
  // 现在的Dart好像不支持这样的赋值，直接说无法强转
  // p2 as Person;

  Person p3 = new Person('www',23);
  p3.printInfo();

  p3.name = 'wwj';
  p3.age = 24;
  p3.printInfo();
  // 上面这种写法等价于下面这个
  p3..name = 'wwj is a handsome boy!'
    ..age = 18
    ..printInfo();
}