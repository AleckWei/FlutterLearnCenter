import '02 Dart中创建义类 使用类.dart';

class Person{
  // 类的名称首字母要大写！
  String name = 'wwj';
  int age = 22;

  // 默认构造函数 只能有一个
  // Person(){
  //   print('构造函数被执行了！');
  // }

  // 有参数的默认构造函数
  // Person(String name,int age){
  //   this.name = name;
  //   this.age = age;
  // }

  // 构造函数的简写
  Person(this.name,this.age);

  //命名构造函数
  Person.hamesome(){print('omg! cool！！');}
  Person.setName(this.name);

  getInfo(){
    print('$name --- $age');
    // print('${this.name}');
  }

  setInfo(age){
    this.age = age;
  }

}

main(List<String> args) {
  // Person p1 = new Person('wwj',18);
  // 默认实例化类的时候 调用的是 默认的构造函数

  Person wwj = new Person.hamesome();
  Person unKnow = new Person.setName('U know who');
  print(unKnow.name.toString());
}