main(List<String> args) {
  // 1.基础赋值运算符 =   ??=
  // = 把右边的值赋值给左边的
  int a = 1;
  int b = 2;
  int c = a+b;
  print(c);

  // a??=x  如果a的值是空的，就把x的值赋值给a。
  int d = 10;
  d ??= 23;
  print(d);

  int e;
  e ??= 13;
  print(e);
  e = 22;
  print(e); 

  //2.符合赋值运算符
  var g = 1;
  g += 2;
  print("g:"+g.toString());
  g *= 3;
  print("g:"+g.toString());

}