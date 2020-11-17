/**
 * 内置方法/ 函数
 * 
 *  print();
 * 
 * 自定义方法：
 *    自定义方法的基本格式：
 *    
 *    返回类型 方法名称(参数1，参数2，...){
 *        方法体；
 *        return 返回值；// 如果 返回类型 为void，则没有这个
 *    }
 * 
 */

void printInfo(){
  print('自定义方法');
}

int getNum2(){
    var myNum = 123;
    return myNum;
}

String printUserInfo(){
  String str = 'I am WWJ!';
  return str;
}

void main(){
  print('调用系统内置的方法');
  printInfo();

  int getNum(){
    var myNum = 123;
    return myNum;
  }

  print(getNum());
  print(getNum2());
  print(printUserInfo());

  // 方法具有作用域
  void xxx(){
    aaa(){
      print('aaa');
    }
    aaa();
  }
  xxx();
  // aaa();
  //在xxx()外是执行不了aaa()方法的，因为它定义在了xxx()内部。
}