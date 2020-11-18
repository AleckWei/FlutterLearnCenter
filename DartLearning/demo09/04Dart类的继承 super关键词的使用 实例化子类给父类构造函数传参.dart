class Person {
  String name = '张三0';
  num age = 35;
  Person(this.name,this.age);
  void printInfo(){
    print('姓名：${this.name}，年龄：${this.age}');
  }
}

class Son extends Person{
  Son(String name, num age) : super(name, age);
}

main(List<String> args) {
  Person person = new Person('李四',20);
  Son son = new Son('张三',10);
  son.printInfo();
}