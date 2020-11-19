class Person {
  String name;
  int age;
  Person(this.name,this.age);

  Person.setInfo(String name,int age){
    this.name = name;
    this.age = age;
  }

  void printInfo(){
    print('Person1:${this.name} --- ${this.age}');
  }
}