main(List<String> args) {
  // ! 取反
  bool f = true;
  print(f);

  f = !f;
  print(f);

  // && 并且：全为true，返回true；否则返回false
  bool a = true;
  bool b = false;
  bool c = true;
  print(a && b);
  print(a && c);
  print(b && c);


  // || 或者: 全为false，返回false；否则返回true
  print(a || b);
  print(a || c);
  print(b || c);
}