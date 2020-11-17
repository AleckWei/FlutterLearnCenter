/**
 * Dart 判断数据类型
 * is 关键字来判断
 */
main(List<String> args) {
  var str = '1231';
  if(str is String){
    print('string');
  }else if(str is int){
    print('int');
  }else{
    print('str is others');
  }
  
}