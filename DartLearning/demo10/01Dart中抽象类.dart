/**
 * Dart中抽象类：Dart抽象类主要用于定义标准，子类可以继承抽象类，也可以实现抽象类接口
 * 
 *  1.抽象类通过abstract关键字来定义
 *  2.Dart中的抽象方法不能用abstract声明，Dart中没有方法体的方法被称为抽象方法。
 *  3.如果子类继承抽象类，必须要实现其中的抽象方法
 *  4.如果把抽象类当做接口实现类的话，必须要实现抽象类里面定义的所有属性和方法。
 *  5.抽象类不能被实例化，只要继承它的子类可以
 * 
 * extends 和 implements 的区别
 *  1.如果要复用抽象类里面的方法，并且要用抽象方法约束子类的话，我们就用extends继承抽象类
 *  2.如果只是把抽象类当做标准的话，我们就用implements实现抽象类
 * 
 * 
 */
// 案例：定义一个Animal 类要求它的子类必须要有eat()方法：

abstract class Animal {
  eat(); // 这样就是抽象方法
  run();
  void printInfo(){
    print('抽象类也可以有普通方法');
  }
}

class Dog extends Animal {
  @override
  eat() {
    // TODO: implement eat
    print('小狗吃吃吃');
  }

  @override
  run() {
    // TODO: implement run
    print('小狗跑跑跑');
  }
}

class Cat extends Animal {
  @override
  eat() {
    // TODO: implement eat
    print('小猫吃小鱼');
  }

  @override
  run() {
    // TODO: implement run
    print('小猫跑跑跑');
  }
  
}

main(List<String> args) {
  Dog dog = new Dog();
  dog.eat();

  Cat cat = new Cat();
  cat.run();

  dog.printInfo();
  cat.printInfo();
}