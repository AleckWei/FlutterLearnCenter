main(List<String> args) {
  // Sting -> Number
  String str = '1345';
  var num = int.parse(str);

  if(num is int){
    print('是!');
  }else{
    print('不是！');
  }

  String str2 = '1345.2';
  var num2 = double.parse(str2);

  if(num2 is double){
    print('是!');
  }else{
    print('不是！');
  }

  // 解决报错
  String str3;
  try{
    var num3 = double.parse(str3);
    print(num3);
  }catch(err){
    print(0);
  }

  //2.Number -> String
  int num4 = 123;
  var str4 = num4.toString();
  print(str4);
  print(str4 is String);
  print(str4.isEmpty);

  //3.被除数为0:
  var myNum = 0/0;
  if(myNum.isNaN){
    print('NaN');
  }

}