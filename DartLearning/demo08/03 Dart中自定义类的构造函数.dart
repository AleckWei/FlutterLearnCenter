class Person{
  // 类的名称首字母要大写！
  String name = 'wwj';
  int age = 22;

  // 默认构造函数
  // Person(){
  //   print('构造函数被执行了！');
  // }

  // 有参数的构造函数
  // Person(String name,int age){
  //   this.name = name;
  //   this.age = age;
  // }

  // 构造函数的简写
  Person(this.name,this.age);

  //命名构造函数

  getInfo(){
    print('$name --- $age');
    // print('${this.name}');
  }

  setInfo(age){
    this.age = age;
  }

}

main(List<String> args) {
  // 使用类就要实例化
  Person p1 = new Person('???',11);
  print(p1.name);
  p1.getInfo();

  p1.setInfo(12);
  p1.getInfo();
}