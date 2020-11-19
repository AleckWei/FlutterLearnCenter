/**
 * 部分导入
 *    如果只需要导入库的一部分，有两种模式：
 *        模式一：只导入需要的部分，使用show关键字，例子：
 *           import 'package:lib1/lib1.dart' show foo;
 *        模式二：隐藏不需要的部分，使用hide关键字，例子：
 *           import 'package:lib2/lib2.dart' hide foo;
 */
import 'lib/myMath.dart' show getName ;
main(List<String> args) {
  getName();
  // getSex(); // 在show getName的时候，这里是读不到getSex方法的。
  // hide同理，很好理解，不做演示
}