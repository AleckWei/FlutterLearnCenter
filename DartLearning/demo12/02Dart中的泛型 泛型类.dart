// class PrintClass {
//   List list = new List<int>();

//   void add(int value) {
//     this.list.add(value);
//   }

//   void printInfo() {
//     for (var i = 0; i < this.list.length; i++) {
//       print(this.list[i]);
//     }
//   }
// }

// 将PrintClass转换成泛型
class PrintClass<T> {
  List list = new List<T>();

  void add(T value) {
    this.list.add(value);
  }

  void printInfo() {
    for (var i = 0; i < this.list.length; i++) {
      print(this.list[i]);
    }
  }
}

main(List<String> args) {
  PrintClass pc = new PrintClass<int>();
  // 这里将pc指定为PrintClass的int型的实例
  pc.add(1);
  pc.add(12);
  pc.add(5);
  pc.printInfo();

  PrintClass pcString = new PrintClass<String>();
  pcString.add('你好呀~');
  pcString.add('hhh');
  // pcString.add(111);
  //type 'int' is not a subtype of type 'String' of 'value'
  pcString.printInfo();
}
