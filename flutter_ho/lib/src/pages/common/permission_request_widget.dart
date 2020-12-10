import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

// 权限请求模板
class PermissionRequestWidget extends StatefulWidget {
  final Permission permission;
  final List<String> permissionList;
  final bool isCloseApp;
  final String leftButtonText;

  PermissionRequestWidget(
      {@required this.permission,
      @required this.permissionList,
      this.isCloseApp = false,
      this.leftButtonText = '再考虑一下'});

  @override
  _PermissionRequestWidgetState createState() =>
      _PermissionRequestWidgetState();
}

class _PermissionRequestWidgetState extends State<PermissionRequestWidget>
    with WidgetsBindingObserver {
  // 是否去设置中心
  bool _isGoSetting = false;

  //页面初始化
  @override
  void initState() {
    super.initState();
    checkPermission();
    //  注册观察者
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 注销观察者
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && _isGoSetting) {
      // 当app被重新启动
      // 并且前往设置中心的标志位被设置为true时，就要再检查一次权限的状态
      checkPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //  只作权限处理，页面不要显示东西
    );
  }

  void checkPermission({PermissionStatus status}) async {
    //  动态获取权限
    Permission permission = widget.permission; // 用全局变量的形式去读取我们要的权限

    if (status == null) {
      //  权限状态
      status = await permission.status;
    }

    if (status.isUndetermined) {
      //  如果用户之前从未申请过权限
      showPermissionAlert(widget.permissionList[0], "同意", permission);
    } else if (status.isDenied) {
      if (Platform.isIOS) {
        // ios平台没有拒绝后第二次请求，所以就得直接去设置中心了
        showPermissionAlert(widget.permissionList[2], "去设置中心", permission,
            isSetting: true);
        return;
      }
      //  如果用户拒绝了这个权限
      showPermissionAlert(widget.permissionList[1], "重试", permission);
    } else if (status.isPermanentlyDenied) {
      //  如果用户拒绝了这个权限并且不再询问这个权限
      showPermissionAlert(widget.permissionList[2], "去设置中心", permission,
          isSetting: true);
    } else {
      //  通过了权限申请
      Navigator.of(context).pop(true);
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
                child: Text(
                  '${widget.leftButtonText}',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  if (widget.isCloseApp) {
                    onCloseApp();
                  } else {
                    Navigator.of(context).pop(false);
                  }
                },
              ), // 左边的按钮
              CupertinoDialogAction(
                  child: Text(
                    '$rightString',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    // 申请权限前先关闭弹框
                    Navigator.of(context).pop();
                    if (isSetting) {
                      _isGoSetting = true;
                      //  去设置中心
                      openAppSettings(); // 调用系统方法前往设置中心
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
}
