// Dart中我们也可以在构造函数体运行之前初始化实例变量
class Rect {
  
  int height;
  int width;
  
  Rect():height=11,width=2{}

  getArea(){
    return this.height * this.width;
  }
}

main(List<String> args) {
  Rect r = new Rect();
  print(r.getArea());
}