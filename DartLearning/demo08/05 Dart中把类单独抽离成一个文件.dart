// 我们将Person抽离到了lib下的Person.dart文件

import 'lib/Person.dart'; // 从这个文件中引入Person类

main(List<String> args) {
  Person p1 = new Person.handsome();
  p1.setName('wwj');
  p1.printInfo();
}