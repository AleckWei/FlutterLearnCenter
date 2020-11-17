main(List<String> args) {
  // 1.if else 
  // 略

  // 2.三目运算符
    var f = true;
    var c = f? '你好！':'我不好！';
    print(c);

  // 3.a??b a为空的话，就把b的值赋值给a
    var a;
    a ?? 10;
    print(a);
    a = 11;
    print(a);
}