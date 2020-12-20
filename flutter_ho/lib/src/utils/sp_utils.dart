import 'dart:convert';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  // 静态实例
  static SharedPreferences _sharedPreferences;

  // 应用启动时需要调用
  // 初始化
  static Future<bool> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }

  // 按照key来删除某个数据
  static void remove(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      _sharedPreferences.remove(key);
    }
  }

  // 异步保存基本数据类型
  static Future save(String key, dynamic value) async {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    }
  }

  // 异步读取数据
  static bool getBool(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.getBool(key);
    } else {
      LogUtils.e("获取Bool，没有key:$key");
    }
    return null;
  }

  static double getDouble(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.getDouble(key);
    } else {
      LogUtils.e("获取Double，没有key:$key");
    }
    return null;
  }

  static int getInt(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.getInt(key);
    } else {
      LogUtils.e("获取Int，没有key:$key");
    }
    return null;
  }

  static String getString(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.getString(key);
    } else {
      LogUtils.e("获取String，没有key:$key");
    }
    return null;
  }

  static List<String> getStringList(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.getStringList(key);
    } else {
      LogUtils.e("获取StringList，没有key: $key");
    }
    return null;
  }

  // 保存自定义对象
  // ignore: non_constant_identifier_names
  static Future saveObject(String key, dynamic Obj) async {
    _sharedPreferences.setString(key, json.encode(Obj));
  }

  // 获取自定义对象
  static dynamic getObject(String key) {
    if (_sharedPreferences.containsKey(key)) {
      String _data = _sharedPreferences.getString(key);
      return (_data == null || _data.isEmpty) ? null : json.decode(_data);
    } else {
      LogUtils.e("获取自定义对象，没有key：$key");
    }
    return null;
  }


}
