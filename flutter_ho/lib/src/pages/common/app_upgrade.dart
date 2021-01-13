import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ho/src/bean/bean_version.dart';
import 'package:flutter_ho/src/net/dio_utils.dart';
import 'package:flutter_ho/src/net/http_helper.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';
import 'package:flutter_ho/src/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:install_plugin_custom/install_plugin_custom.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';

// ignore: missing_return
Future<bool> checkAppVersion(BuildContext context,
    {bool showToast = false}) async {
  Map<String, dynamic> map = {};

  // 真实的dio请求
  // ResponseInfo responseInfo = await DioUtils.instance.getRequest(
  //   url: HttpHelper.appVersion,
  //   queryParameters: map,
  // );

  // 模拟了一个网络请求
  ResponseInfo responseInfo =
      await Future.delayed(Duration(milliseconds: 1000), () {
    // 请保证字段名称是和定义的bean当中的相同，否则赋值不了
    return ResponseInfo(
      data: {
        "isNeed": true,
        "updateContent": "修改了一堆bug12333333333333333333333333333333333333333"
            "33333333333333333333333333333333333333333333333333",
        "packageUrl":
            "http://pic.studyyoun.com/96b282d9-f82c-46fb-8767-754bd6288775.apk"
      },
    );
  });

  if (responseInfo.success) {
    Map element = responseInfo.data;
    AppVersionBean appVersionBean = AppVersionBean.fromJson(element);
    if (appVersionBean != null) {
      if (appVersionBean.isNeed) {
        // 如果是需要升级的话，就弹出一个对话框去提示升级
        showAppUpgradeDialog(
          context: context,
          upgradeText: appVersionBean.updateContent,
          apkUrl: appVersionBean.packageUrl,
        );
      } else {
        if (showToast) {
          ToastUtils.showToast('已经是最新版本');
        }
      }
    } else {
      if (showToast) {
        ToastUtils.showToast('已经是最新版本');
      }
    }
  }
}

void showAppUpgradeDialog({
  @required BuildContext context,
  // 是否需要强制升级
  bool isForce = false,
  // 点击背景是否消失
  bool isBackDismiss = false,
  // 升级提示内容
  String upgradeText = '',
  String apkUrl = '',
}) {
  // 通过透明的方式打开一个弹窗页面
  NavigatorUtils.pushPageByFade(
    context: context,
    targetPage: AppUpgradePage(
      isForce: isForce,
      isBackDismiss: isBackDismiss,
      upgradeText: upgradeText,
      apkUrl: apkUrl,
    ),
  );
}

class AppUpgradePage extends StatefulWidget {
  // 是否强制升级
  final bool isForce;

  // 点击背景是否消失
  final bool isBackDismiss;

  final String upgradeText;

  final String apkUrl;

  AppUpgradePage({
    this.isForce = false,
    this.upgradeText = "",
    this.apkUrl,
    this.isBackDismiss = false,
  });

  @override
  State<StatefulWidget> createState() => _AppUpgradeState();
}

class _AppUpgradeState extends State<AppUpgradePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: new Material(
        type: MaterialType.transparency,
        //  监听手机上的物理返回键
        child: WillPopScope(
          onWillPop: () async {
            closeApp(context);
            // 这里返回true表示不拦截
            // 返回false拦截事件的向上传递
            return Future.value(true);
          },
          child: GestureDetector(
            onTap: () {
              if (!widget.isForce && widget.isBackDismiss) {
                closeApp(context);
              }
            },
            child: buildBodyContainer(context),
          ),
        ),
      ),
    );
  }

  void closeApp(BuildContext context) {
    // 如果是正在下载当中，则取消这个网络请求
    if (_cancelToken != null && !_cancelToken.isCancelled) {
      _cancelToken.cancel();
    }
    if (widget.isForce) {
      SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
    } else {
      Navigator.of(context).pop();
    }
  }

  Container buildBodyContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(context),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      child: Container(
        width: 280,
        height: 320,
        color: Colors.white,
        child: buildColumn(context),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // 包裹子Widget的中轴的宽度
      mainAxisSize: MainAxisSize.min,
      children: [
        buildHeaderWidget(context),
        SizedBox(height: 12),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 14),
              child: Text(
                '${widget.upgradeText}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        buildBottomButton()
      ],
    );
  }

  // 头部标题提示文字
  Container buildHeaderWidget(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // 弹窗的标题栏
          Positioned(
            left: 0,
            right: 0,
            top: 28,
            child: Text(
              '升级版本',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
          // 右上角的关闭按钮
          Positioned(
              right: 0,
              child: CloseButton(
                onPressed: () {
                  closeApp(context);
                },
              ))
        ],
      ),
    );
  }

  StreamController<double> _streamController = new StreamController();

  // 用一个枚举类型的，来标识下载的状态
  InstallStatues _installStatues = InstallStatues.none;

  // apk保存路径
  String appLocalPath;

  // 取消下载的标识
  CancelToken _cancelToken;

  // 底部的按钮区域
  // 实现类似进度条那样的效果
  StreamBuilder<double> buildBottomButton() {
    return StreamBuilder<double>(
      // 由这个流控制器传递下载进度过来
      stream: _streamController.stream,
      // 初始的下载进度为0
      initialData: 0.0,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        return Container(
          child: Stack(
            children: [
              // 构建一个随着下载进度改变的按钮
              buildMaterial(context, snapshot),
              ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  // 用传过来的进度，动态地改变这里的宽度
                  widthFactor: snapshot.data,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 构建按钮的主体
  Material buildMaterial(BuildContext context, AsyncSnapshot<double> snapshot) {
    return Material(
      color: Colors.redAccent,
      child: Ink(
        child: InkWell(
          onTap: onTapFunction,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Text(
              buildButtonText(snapshot.data),
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void onTapFunction() {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      InstallPluginCustom.gotoAppStore(
          "https://apps.apple.com/cn/app/id1453826566");
      return;
    }

    if (_installStatues == InstallStatues.none ||
        _installStatues == InstallStatues.downloading ||
        _installStatues == InstallStatues.downloadFailed) {
      // 将状态置为下载中
      _installStatues = InstallStatues.downloading;
      downApkFunction();
    } else if (_installStatues == InstallStatues.downloadFinish ||
        _installStatues == InstallStatues.installFailed) {
      // 下载完成 或 安装失败，就尝试去再安装一遍
      installApkFunction();
    }
  }

  void downApkFunction() async {
    String savePath = await getPhoneLocalPath();
    String appName = "rk.apk";

    Dio dio = new Dio();
    _cancelToken = new CancelToken();

    appLocalPath = "$savePath$appName";

    try {
      Response response = await dio.download(widget.apkUrl, appLocalPath,
          cancelToken: _cancelToken, onReceiveProgress: (received, total) {
        if (total != -1) {
          // 当前下载的百分比
          print((received / total * 100).toStringAsFixed(0) + "%");
          // 控制按钮那里的进度条
          _streamController.add(received / total);
          setState(() {});
        }
      });
      print('下载完成');
      setState(() {
        _streamController.add(0.0);
      });
      _installStatues = InstallStatues.downloadFinish;
      installApkFunction();
    } catch (e) {
      print('${e.toString()}');
      _installStatues = InstallStatues.downloadFailed;
      setState(() {});
    }
  }

  void installApkFunction() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    InstallPluginCustom.installApk(appLocalPath, packageName).then((value) {
      print('install apk $value');
    }).catchError((onError) {
      _installStatues = InstallStatues.downloadFailed;
      setState(() {});
    });
  }

  String buildButtonText(double progress) {
    String buttonText = '';
    switch (_installStatues) {
      case InstallStatues.none:
        buttonText = '升级';
        break;
      case InstallStatues.downloading:
        buttonText = '下载中' + (progress * 100).toStringAsFixed(0) + '%';
        break;
      case InstallStatues.downloadFinish:
        buttonText = '点击安装';
        break;
      case InstallStatues.downloadFailed:
        buttonText = '重新下载';
        break;
      case InstallStatues.installFailed:
        buttonText = '重新安装';
        break;
    }
    return buttonText;
  }

  Future<String> getPhoneLocalPath() async {
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }
}

enum InstallStatues {
  none,
  downloading,
  downloadFinish,
  downloadFailed,
  installFailed,
}
