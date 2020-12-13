class LogUtils {
  // 是否输出日志标识
  static bool _isLog = true;

  static String _logFlag = "Flutter-MyLove";

  static void init({bool islog = false, String logFlag = 'Flutter-MyLove'}) {
    _isLog = islog;
    _logFlag = logFlag;
  }

  static void e(String msg) {
    if (_isLog) {
      print("$_logFlag | $msg");
    }
  }
}
