import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with WidgetsBindingObserver {
  // 保存弹出框文案的list
  List<String> _list = [
    '为您更好的体验应用，所以需要获取您手机文件存储权限，以保存您一些偏好设置',
    '您已拒绝权限，所以无法保存您的一些偏好设置，将无法使用app',
    '您已拒绝权限，请在设置中心同意app的权限请求',
    '其他错误'
  ];

  // 是否去设置中心
  bool _isGoSetting = false;

  //页面初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
    //  注册观察者
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed && _isGoSetting){
      // 当app被重新启动
      // 并且前往设置中心的标志位被设置为true时，就要再检查一次权限的状态
      checkPermission();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 注销观察者
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/ic_mylove.png',
          height: 66,
          width: 66,
        ),
      ),
    );
  }

  void checkPermission({PermissionStatus status}) async {
    //  动态获取权限
    Permission permission = Permission.storage;

    if (status == null) {
      //  权限状态
      status = await permission.status;
    }

    if (status.isUndetermined) {
      //  如果用户之前从未申请过权限
      showPermissionAlert(_list[0], "同意", permission);
    } else if (status.isDenied) {
      //  如果用户拒绝了这个权限
      showPermissionAlert(_list[1], "重试", permission);
    } else if (status.isPermanentlyDenied) {
      //  如果用户拒绝了这个权限并且不再询问这个权限
      showPermissionAlert(_list[2], "去设置中心", permission);
    } else {
      //  通过了权限申请
    }
  }

  // 设置一个弹窗（苹果风格）
  void showPermissionAlert(
      String msg, String rightString, Permission permission,
      {bool isSetting = false}) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('温馨提示'),
            content: Container(
              padding: EdgeInsets.all(12),
              child: Text(msg),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('退出应用'),
                onPressed: () {
                  onCloseApp();
                },
              ), // 左边的按钮
              CupertinoDialogAction(
                  child: Text('$rightString'),
                  onPressed: () {
                    // 申请权限前先关闭弹框
                    Navigator.of(context).pop();

                    if (isSetting) {
                      _isGoSetting = true;
                      //  去设置中心
                      onAppSettings();
                    } else {
                      // 申请权限
                      requestPermission(permission);
                    }
                  }), // 右边的按钮
            ],
          );
        });
  }

  void requestPermission(Permission permission) async {
    // 申请权限的主方法
    PermissionStatus status = await permission.request();

    // 申请之后需要再校验一次
    checkPermission(status: status);
  }

  void onCloseApp() {
    // 调用系统方法去关闭应用
    SystemChannels.platform.invokeMapMethod("SystemNavigator.pop");
  }

  void onAppSettings() async {}
}
