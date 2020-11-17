// 定义一个类要在main的外面

class Person{
  // 类的名称首字母要大写！
  String name = 'wwj';
  int age = 22;

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
  Person p1 = new Person();
  print(p1.name);
  p1.getInfo();

  p1.setInfo(12);
  p1.getInfo();
}