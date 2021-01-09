import 'package:flutter_ho/src/bean/bean_user.dart';

class UserHelper {
  //私有化构造函数
  UserHelper._() {}

  // 创建全局单例对象
  static UserHelper getInstance = UserHelper._();

  UserBean _userBean;

  // 依据是否有这个用户信息来判断用户是否已经登录
  bool get isLogin => _userBean != null;
}
