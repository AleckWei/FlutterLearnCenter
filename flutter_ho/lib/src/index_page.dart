import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ho/src/pages/common/protocol_model.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';

import 'package:permission_handler/permission_handler.dart';

import 'pages/common/permission_request_widget.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with ProtocolModel {
  // 保存弹出框文案的list
  List<String> _list = [
    '为您更好的体验应用，所以需要获取您手机文件存储权限，以保存您一些偏好设置',
    '您已拒绝权限，所以无法保存您的一些偏好设置，将无法使用app',
    '您已拒绝权限，请在设置中心同意app的权限请求',
    '其他错误'
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      initData();
      // Navigator.of(context)
      //     .push(PageRouteBuilder(
      //         opaque: false,
      //         pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) {
      //           return PermissionRequestWidget(
      //             permissionList: this._list,
      //             permission: Permission.camera,
      //           );
      //         }))
      //     .then((value) {
      //   if (value == null || value == false) {
      //     //  权限请求不通过
      //   } else {
      //     //  权限请求通过
      //   }
      // });
    });
  }

  void initData() {
    // 获取当前的运行环境
    bool isLog = !bool.fromEnvironment("dart.vm.product");
    // 当运行环境不为release环境时，不输出日志
    LogUtils.init(islog: isLog);
    LogUtils.e('权限申请');
    // 权限申请
    NavigatorUtils.pushPageByFade(
      context: context,
      // 目标页面
      targetPage: PermissionRequestWidget(
        // 提示文案
        permissionList: this._list,
        // 所需要申请的权限
        permission: Permission.camera,
        // 显示关闭应用的按钮
        isCloseApp: true,
        // 左边按钮的文字
        leftButtonText: '退出',
      ),
      // 权限申请的结果
      dismissCallBack: (value) {
        // 插值表达法
        LogUtils.e('权限申请结果$value');
        initDataNext();
      },
    );
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

  // 初始化工具类
  void initDataNext() async {
    //  当中要初始我们本地的方法
    //  初始第三方sdk
    //  初始隐私协议
    bool isAgreement = await showProtocolFunction(context);
    if (isAgreement) {
      //  表示同意
      LogUtils.e('同意协议');
    } else {
      LogUtils.e('不同意协议');
      closeApp();
    }
    //  等业务，根据具体业务来操作
  }

  void closeApp() {
    SystemChannels.platform.invokeMapMethod("SystemNavigator.pop");
  }
}
