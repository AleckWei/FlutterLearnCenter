import 'lib/MsSql.dart';
import 'lib/MySql.dart';

/**
 * 和Java一样，dart也有它的接口，但是和Java还是有区别的。
 * 
 *  首先，dart接口没有interface关键字定义接口，而是普通类或者是抽象类可以作为接口被实现
 *  同样使用implements关键字进行实现
 * 
 *  但是dart的接口有点奇怪，如果实现的类是普通的类，会将普通类和抽象类中的方法全部重写一遍
 * 
 *  而因为抽象类可以定义抽象方法，普通类不可以，所以一般如果要实现像Java接口那样的方式，一般会使用抽象类，
 * 
 *  建议使用抽象类定义接口
 */

// 定义一个DB库 支持 mysql mssql MongoDB
// 要求mysql mssql MongoDB这三个类都有同样的方法

main(List<String> args) {
  MySql mysql = new MySql('172.28.4.154');
  mysql.add(111);
  print(mysql.url);

  MsSql msSql = new MsSql('123456');
  msSql.add('你好！');
  print(msSql.url);
}