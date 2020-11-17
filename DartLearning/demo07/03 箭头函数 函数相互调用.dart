main(List<String> args) {
  // 使用forEach打印下面List里面的数据

  List list = ['苹果','香蕉','西瓜'];
  list.forEach((element)=> print(element));
  // 箭头函数只有一行，后面不带分号

  // 修改下面List里面的数据，让数组中大于2的值乘以2：
  List numList = [1,2,3,4,5,6,7,8];
  var newNumList = numList.map((e){
    if(e>2){
      return e*2;
    }
    return e;
  });

  print(numList);
  print(newNumList.toList());

  newNumList = numList.map((e) => e>2 ? e*2:e); // 箭头函数显得更加的简洁
  print(newNumList.toList());
  
}