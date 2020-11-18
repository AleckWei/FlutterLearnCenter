/**
 * mixins的中文意思是混入，就是在类中混入其他的功能
 * 
 * 在Dart中可以使用mixins实现类似多继承的功能
 * 
 * 因为mixins使用的条件，随着Dart版本一直在变，这里讲的是Dart2.x中使用mixins的条件
 * 
 *  1.作为mixins的类只能继承自Object，不能继承其他的类。
 *  2.作为mixins的类不能有构造函数
 *  3.一个类可以mixins多个mixins类
 *  4.mixins绝不是继承，也不是接口，而是一种全新的特性
 */

class A{
  String info = 'This is A';
  void printA(){
    print("AAA");
  }
}

class B {
  void printB(){
    print("BBB");
  }
}

class C with A,B {
}

main(List<String> args) {
  var c = new C();
  c.printA();
  c.printB();
  print(c.info);
}