import 'package:flutter_ho/src/bean/bean_user.dart';
import 'package:flutter_ho/src/utils/sp_utils.dart';

class UserHelper {
  //私有化构造函数
  UserHelper._();

  // 创建全局单例对象，用于外部调用
  static UserHelper getInstance = UserHelper._();

  UserBean _userBean;

  // 依据是否有这个用户信息来判断用户是否已经登录
  bool get isLogin => _userBean != null; // userBean不为空时，表示用户已经登录

  set userBean(UserBean userBean) {
    // 将用户信息保存到app的运行内存当中
    _userBean = userBean;
    // 将用户信息保存到手机的缓存中
    SPUtils.saveObject("user_bean", _userBean);
  }

  get userBean => _userBean;

  void init() {
    Map<String, dynamic> map = SPUtils.getObject("user_bean");
    if (map != null) {
      // 加载缓存
      _userBean = UserBean.fromMap(map);
    }
  }

  void clear() {
    _userBean = null;
    SPUtils.remove("user_bean");
  }
}
