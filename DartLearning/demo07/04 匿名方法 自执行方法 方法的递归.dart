int getNum(int n){
  return n;
}

main(List<String> args) {
  print(getNum(111));

  var printNum = (){
    print(123);
  };

  printNum();

  // 自执行方法
  ((){
    print('自执行方法');
  })();

  // 方法的递归
  var sum = 1;
  fn(n){
    sum *= n;
    if(n==1){
      return;
    }
    fn(n-1);
  }

  fn(5);
  print(sum);

  //用递归的方法求1-100的和
  var start = 0;
  fn1(n){
    start +=n;
    if(n==0){
      return;
    }
    fn1(n-1);
  }
  fn1(100);
  print(start);
}