/**
 * 
 * Dart中类的继承:
 *  1.子类使用extends关键词来继承父类
 *  2.子类会继承父类里面的可见属性和方法，但是不会继承父类的构造函数
 *  3.子类能复写父类的方法 getter 和 setter
 */

class Person {
  String name = '张三0';
  num age = 35;
  void printInfo(){
    print('姓名：${this.name}，年龄：${this.age}');
  }
}

class Son extends Person{

}

main(List<String> args) {
  Son son = new Son();
  print(son.name);
  print(son.age);
  son.printInfo();
}