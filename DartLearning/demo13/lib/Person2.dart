class Person {
  String name;
  int age;
  Person(this.name,this.age);

  Person.setInfo(String name,int age){
    this.name = name;
    this.age = age;
  }

  void printInfo(){
    print('Person2:${this.name} --- ${this.age}');
  }
}