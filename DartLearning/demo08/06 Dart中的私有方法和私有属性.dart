import 'lib/Animal.dart';

/**
 * Dart和其他面向对象的语言不一样，Dart中没有public private protected 这些访问修饰符
 * 但是我们可以使用一个 "_" 把一个属性或者方法定义成私有
 * 并且要抽离到单独的一个文件中才能生效
 * 一般来说，私有属性是不能被直接访问的，
 * 但是如果我用一个公有的方法，去return一下这个私有属性。就是我们平时的getter
 */

// class Animal {
//   String _name;
//   int age;

//   Animal(this._name,this.age);

//   void printInfo(){
//     print('$_name --- $age');
//   }
// }

main(List<String> args) {
  Animal dog = new Animal('dog', 1);
  dog.printInfo();
  // print(dog._name); //当我把Animal抽离到另一个文件时，这里就报红报错了
  // 只有当Animal类在这个文件当中，_name才能被访问到，否则是不行的
  print(dog.age);
}