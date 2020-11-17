/**
 * Dart数据类型：布尔类型
 * bool 值true/false
 */

main(List<String> args) {
  //1.bool布尔声明
  bool flag = true;
  print(flag);

  // flag = 0;
  //type 'int' can't be assigned to a variable of type 'bool'.
  print(flag);

  //2.条件判断
  var f = true;
  if(f){
    print("真");
  }else{
    print("假");
  }
}