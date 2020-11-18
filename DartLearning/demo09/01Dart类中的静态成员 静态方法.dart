/**
 * Dart中的静态成员：
 *  1.使用static 关键字来实现类级别的变量和函数
 *  2.静态方法不能访问非静态成员，非静态方法可以访问静态成员
 * 
 */

class Person{
  static String id = '100203290';
  void show(){
    print(id);
  }
  static void show1(){
    print('静态的show方法');
  }
}

class Aniaml {
  static String name = 'dog';
  int age = 20;

  static void show(){
    print(name);
  }
  void printInfo(){ // 非静态方法访问静态属性
    print(name); // 访问静态属性
    print(this.age);  // this.方法相当于从实例中取这个age
  }

  static void printAniamlInfo(){
    print(name);
    show();
    // print(this.age); // 静态方法没法访问非静态属性，这里是报错的。
  }
}

main(List<String> args) {
  var p = new Person();
  p.show();
  print(Person.id);
  Person.show1();
}