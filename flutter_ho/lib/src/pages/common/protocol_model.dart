import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/common/common_webview.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';

class ProtocolModel {
  TapGestureRecognizer _registerProtocolRecognizer;
  TapGestureRecognizer _privateProtocolRecognizer;

  //  用来显示用户协议对话框
  Future<bool> showProtocolFunction(BuildContext context) async {
    // 用户协议的手势
    _registerProtocolRecognizer = TapGestureRecognizer();
    // 隐私协议的手势
    _privateProtocolRecognizer = TapGestureRecognizer();

    // 苹果风格的弹窗
    bool isShow = await showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return showProtocolDialog(context);
        });

    // 弹窗结束后，销毁手势监听
    _registerProtocolRecognizer.dispose();
    _privateProtocolRecognizer.dispose();

    return Future.value(isShow);
  }

  CupertinoAlertDialog showProtocolDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('隐私协议'),
      content: Container(
        height: 180,
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: buildContent(context),
        ),
      ),
      actions: [
        // 这里面的数组是从左到右排列
        CupertinoDialogAction(
          child: Text('不同意'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        CupertinoDialogAction(
          child: Text('同意'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  //协议说明文案
  String userPrivateProtocol = "我们一向尊重并会严格保护用户在使用本产品时"
      "的合法权益（包括用户隐私、用户数据等）不受到任何侵犯。"
      "本协议（包括本文最后部分的隐私政策）是用户"
      "（包括通过各种合法途径获取到本产品的自然人、"
      "法人或其他组织机构，以下简称“用户”或“您”）"
      "与我们之间针对本产品相关事项最终的、完整的且排他的协议，"
      "并取代、合并之前的当事人之间关于上述事项的讨论和协议。"
      "本协议将对用户使用本产品的行为产生法律约束力，"
      "您已承诺和保证有权利和能力订立本协议。"
      "用户开始使用本产品将视为已经接受本协议，"
      "请认真阅读并理解本协议中各种条款，"
      "包括免除和限制我们的免责条款和对用户的权利限制"
      "（未成年人审阅时应由法定监护人陪同），"
      "如果您不能接受本协议中的全部条款，请勿开始使用本产品";

  buildContent(BuildContext context) {
    // RichText富文本，可以设置文字高亮，连接等
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "      请您在使用本产品之前仔细阅读",
              style: TextStyle(color: Colors.grey[600])),
          TextSpan(
            text: "《用户协议》",
            style: TextStyle(color: Colors.blue),
            recognizer: _registerProtocolRecognizer
              ..onTap = () {
                //  打开用户协议
                openUserProtocol(context);
              },
          ),
          TextSpan(text: "与", style: TextStyle(color: Colors.grey[600])),
          TextSpan(
            text: "《隐私协议》",
            style: TextStyle(color: Colors.blue),
            recognizer: _privateProtocolRecognizer
              ..onTap = () {
                //  打开隐私协议
                openPrivateProtocol(context);
              },
          ),
          TextSpan(
              text: userPrivateProtocol,
              style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  // 查看用户协议
  void openUserProtocol(BuildContext context) {
    LogUtils.e("查看用户协议");
    NavigatorUtils.pushPage(
        context: context,
        targetPage: CommonWebViewPage(
          pageTitle: "用户协议",
          htmlUrl: "https://www.baidu.com",
        ));
  }

  // 查看隐私协议
  void openPrivateProtocol(BuildContext context) {
    LogUtils.e("查看隐私协议");
    NavigatorUtils.pushPage(
        context: context,
        targetPage: CommonWebViewPage(
          pageTitle: "隐私协议",
          htmlUrl: "https://www.baidu.com",
        ));
  }
}
