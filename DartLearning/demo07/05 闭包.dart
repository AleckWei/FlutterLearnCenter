/**
 * 闭包：
 *    1.全局变量特点： 全局变量常驻内存，全局变量污染全局
 *    2.局部变量的特点： 不常驻内存，但会被垃圾机制回收，不会污染全局。
 * 
 * 想实现的功能：1.想常驻内存 2.不想污染全局
 * 
 * 
 */

// 全局变量
var a = 123;

// 包含个局部变量的方法
printInfo(){
  var myNum = 111;
  myNum ++;
  print(myNum);
}

// 闭包，了解即可
fn1(){
  var a = 1234;
  return(){
    a++;
    print(a);
  };
}

main(List<String> args) {
  fn(){
    print(a);
    a++;
  }
  fn();
  fn();
  fn();
  fn();
  fn();


  printInfo();
  printInfo();
  printInfo();
  printInfo();

}

