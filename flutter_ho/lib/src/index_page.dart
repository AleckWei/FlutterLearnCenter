import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';

import 'package:permission_handler/permission_handler.dart';

import 'pages/common/permission_request_widget.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
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
    NavigatorUtils.pushPageByFade(
      context: context,
      targetPage: PermissionRequestWidget(
        permissionList: this._list,
        permission: Permission.camera,
      ),
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
}
