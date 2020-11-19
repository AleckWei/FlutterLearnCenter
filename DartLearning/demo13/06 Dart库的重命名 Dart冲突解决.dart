/**
 * 1.冲突解决
 *    当引入的两个库中有相同名称的标识符时，
 *    如果是java通常是写上完整的包名路径来指定使用的
 *    import 'package:lib1/lib1.dart';
 *    import 'package:lib2/lib2.dart' as lib2;
 * 
 *    Element element1 = new Element() //Use Element from lib1
 *    lib2.Element element2 = new lib2.Element(); //Use Element form lib2
 */

import 'lib/Person1.dart';
import 'lib/Person2.dart' as person2; // 库的重命名来解决这个冲突
main(List<String> args) {
  Person p1 = new Person('wwj',22);
  p1.printInfo();

  person2.Person p2 = new person2.Person('???', 1);
  p2.printInfo();
}