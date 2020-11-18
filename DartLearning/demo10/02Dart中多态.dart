/**
 * Dart中的多态：
 *    允许将子类类型的指针赋值给父类类型的指针，同一个函数调用会有不同的执行效果
 * 
 *    子类的实例赋值给父类引用
 * 
 *    多态就是父类定义一个方法不去实现，让继承它的子类去实现，每个子类会有不同的执行效果
 */
// 案例：定义一个Animal 类要求它的子类必须要有eat()方法：

abstract class Animal {
  eat(); // 这样就是抽象方法
}

class Dog extends Animal {
  @override
  eat() {
    // TODO: implement eat
    print('小狗吃吃吃');
  }
  run(){
    print('run');
  }
}

class Cat extends Animal {
  @override
  eat() {
    // TODO: implement eat
    print('小猫吃小鱼');
  }
}

main(List<String> args) {
  Dog dog = new Dog();
  dog.eat();
  dog.run();

  Cat cat = new Cat();
  cat.eat();
}