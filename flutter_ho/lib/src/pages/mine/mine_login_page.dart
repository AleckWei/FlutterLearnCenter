import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 用户登录下的页面
class MineLoginPage extends StatefulWidget {
  @override
  _MineLoginPageState createState() => _MineLoginPageState();
}

class _MineLoginPageState extends State<MineLoginPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: buildStack(),
        ),
      ),
    );
  }

  Stack buildStack() {
    return Stack(
      children: [
        Positioned.fill(
          child: buildBackgroundWidget(),
        ),
      ],
    );
  }

  Container buildBackgroundWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightBlueAccent.withOpacity(0.3),
            Colors.greenAccent.withOpacity(0.3),
          ],
        ),
      ),
    );
  }
}
