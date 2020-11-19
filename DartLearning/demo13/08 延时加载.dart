/**
 * 延迟加载
 *    也称为懒加载：可以在需要的时候再进行加载
 *    懒加载的最大好处是可以减少App的启动时间
 *  
 *    懒加载使用deferred as 关键字来指定，例子：
 * 
 *    import 'package:deferred/hello.dart' deffered as hello;
 *    当需要使用的时候，需要使用loadLibrary()方法来加载：
 * 
*     greet() async{
*       awit hello.loadLibrary();
*       hello.printGreeting();
*     }
 */