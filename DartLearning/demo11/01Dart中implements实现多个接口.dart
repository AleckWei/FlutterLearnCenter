/**
 * Dart中一个类实现多个接口
 */

abstract class A {
  printA();
}

abstract class B {
  printB();
}

class C implements A,B{
  @override
  printA() {
    // TODO: implement printA
    print("实现了A的接口");
  }

  @override
  printB() {
    // TODO: implement printB
    print('实现了B的接口');
  }
  
}

main(List<String> args) {
  C c = new C();
  c.printA();
  c.printB();
}