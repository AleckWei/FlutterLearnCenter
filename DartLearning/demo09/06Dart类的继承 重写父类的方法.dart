class Person {
  String name = '张三0';
  num age = 35;
  Person(this.name,this.age);
  void printInfo(){
    print('姓名：${this.name}，年龄：${this.age}');
  }
  work(){
    print('父亲类：在工作：敲代码中。。。');
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
  // 复写父类的printInfo方法
  @override // 可写可不写，建议在复写父类方法的时候加上
  void printInfo(){
    print('儿子的姓名：${this.name}，儿子的年龄：${this.age}');
  }
  @override
  void work(){
    super.work();
    print('${this.name}的工作是：还不知道呢。。。');
  }
}

main(List<String> args) {
  Person person = new Person('李四',20);
  Son son = new Son('张三',10,'男');
  son.printInfo();
  son.work();
  // son.run();
}