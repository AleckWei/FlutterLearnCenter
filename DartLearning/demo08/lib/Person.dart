class Person{
  String name;
  int age;

//******** 三种构造方法的形式 ************/
  Person(this.name,this.age);

  Person.handsome(){print('omg!COOL!!');}

  Person.setInfo(String name,int age){
    this.name = name;
    this.age = age;
  }
//******** 三种构造方法的形式 ************/
  void setName(name){
    this.name = name;
  }

  void printInfo(){
    print('$name --- $age');
  }
}