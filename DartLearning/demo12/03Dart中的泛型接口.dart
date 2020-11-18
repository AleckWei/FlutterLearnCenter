/**
 * Dart 中的泛型接口：
 *    实现数据缓存的功能：
 *        有文件缓存和内存缓存
 *        内存缓存和文件缓存按照接口的约束来实现。
 *     1.定义一个泛型接口 约束实现它的子类必须有getByKey(key) 和 setByKey(key,value)
 *     2.要求setByKey的时候，value类型和实例化子类的类型保持一致
 */

// abstract class ObjectCache {
//   getByKey(String key);
//   void setByKey(String key, Object value);
// }

// abstract class StringCache {
//   getByKey(String key);
//   void setByKey(String key, String value);
// }

// // 显然，上面两个接口都实现了同样的方法
// // 但是仅仅是传入的参数不同，
// // 这里就可以定义一个泛型的接口，去动态的指定参数的类型：
// abstract class Cache<T> {
//   getByKey(String key);
//   void setByKey(String key, T value);
// }

abstract class Cache<T> {
  getByKey(String key);
  void setByKey(String key, T value);
}

class FileCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    // TODO: implement getByKey
    throw UnimplementedError();
  }

  @override
  void setByKey(String key, value) {
    print('我是文件缓存，把key = $key value = $value 存入内存当中');
  }
}

class MemoryCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    // TODO: implement getByKey
    throw UnimplementedError();
  }

  @override
  void setByKey(String key, T value) {
    print('我是内存缓存，把key = $key value = $value 存入内存当中');
  }
}

main(List<String> args) {
  MemoryCache m = new MemoryCache<Map>();
  m.setByKey('index', {"name": "wwj", "age": "20"});
}
