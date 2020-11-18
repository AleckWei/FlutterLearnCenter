class Person {
  String name = '张三0';
  num age = 35;
  Person(this.name,this.age);
  void printInfo(){
    print('姓名：${this.name}，年龄：${this.age}');
  }
}

class Son extends Person{
  String sex;
  Son(String name, num age,String sex) : super(name, age){ //super也可以指定父类的命名构造函数
    this.sex = sex;
  }
  run(){
    print('姓名：${this.name}，年龄：${this.age},性别:${this.sex}');
  }
}

main(List<String> args) {
  Person person = new Person('李四',20);
  Son son = new Son('张三',10,'男');
  son.printInfo();
  son.run();
}