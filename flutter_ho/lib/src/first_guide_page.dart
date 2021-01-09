import 'package:flutter/material.dart';
import 'package:flutter_ho/src/home_page.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:flutter_ho/src/utils/navigator_utils.dart';

class FirstGuidePage extends StatefulWidget {
  @override
  _FirstGuidePageState createState() => _FirstGuidePageState();
}

class _FirstGuidePageState extends State<FirstGuidePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 最下层的PageView，4个引导页
          buildBackground(width, height),
          // 上一层的引导点点
          buildBottomDoted(),
          // 第三层的去首页的按钮
          buildGoHome(),
        ],
      ),
    );
  }

  Positioned buildBottomDoted() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDoted(_currentIndex == 0),
          buildDoted(_currentIndex == 1),
          buildDoted(_currentIndex == 2),
          buildDoted(_currentIndex == 3),
        ],
      ),
    );
  }

  Widget buildDoted(bool isSelect) {
    return AnimatedContainer(
      height: 12,
      width: isSelect ? 40 : 12,
      margin: EdgeInsets.only(left: 16),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  Positioned buildBackground(double width, double height) {
    return Positioned.fill(
      child: PageView(
        onPageChanged: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        children: [
          Image.asset("assets/images/sp01.png",
              width: width, height: height, fit: BoxFit.fill),
          Image.asset("assets/images/sp02.png",
              width: width, height: height, fit: BoxFit.fill),
          Image.asset("assets/images/sp03.png",
              width: width, height: height, fit: BoxFit.fill),
          Image.asset("assets/images/sp04.png",
              width: width, height: height, fit: BoxFit.fill),
        ],
      ),
    );
  }

  Widget buildGoHome() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: _currentIndex == 3 ? 44 : 0,
            width: _currentIndex == 3 ? 180 : 0,
            child: ElevatedButton(
              child: Text('去首页'),
              onPressed: () {
                LogUtils.e('点击了去首页');
                NavigatorUtils.pushPageByFade(
                    context: context, targetPage: HomePage(), isReplace: true);
              },
            ),
          )
        ],
      ),
    );
  }
}
