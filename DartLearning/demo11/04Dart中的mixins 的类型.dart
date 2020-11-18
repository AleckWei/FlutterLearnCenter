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
  print(c is A);
  print(c is B);
  print(c is C);

  var a = new A();
  print(a is Object);
}