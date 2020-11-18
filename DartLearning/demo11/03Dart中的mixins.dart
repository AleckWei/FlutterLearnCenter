class Person{

  String name;
  num age;
  Person(this.name,this.age);

  printInfo(){
    print('这是一个Person类');
    print('$this.name --- $this.age');
  }
}

// class A extends Person{
// class A can't be used as a mixin because it extends a class other than Object.dart
class A{
  String info = 'This is A';
  void printA(){
    print("AAA");
  }
  void run(){
    print('run A');
  }
}

class B {
  void printB(){
    print("BBB");
  }
  void run(){
    print('run B');
  }
}

class C extends Person with B,A {
  C(String name, num age) : super(name, age);
  // 假如A和B中都有一样的方法(这里是run),那么写with
  // 的时候，写在后面的，就会替换掉前面的。
}

main(List<String> args) {
  var c = new C('wwj',20);
  c.printA();
  c.printB();
  print(c.info);
  c.printInfo();

  c.run();
}