import 'package:flutter/material.dart';
import 'res/listData.dart';

void main() {
  runApp(MyApp());
}

// 对伸缩组件Expanded进行一个介绍以及属性的详解

//自定义组件 == 创建一个类：
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 一般作为app的根组件
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: LayoutDemo(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Container(
              child:ListView(
                children: <Widget>[
                  SizedBox(height: 70),
                  Text(
                    '你好呀~',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              height: 180,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
            ))
          ],
        ),
        SizedBox(height: 10),
        RowContainer(),
      ]),
    );
  }
}

class RowContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.itying.com/images/flutter/1.png'),
                  fit: BoxFit.cover,
                )),
          ),
          flex: 2,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 180,
            child: ListView(
              children: [
                Container(
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.itying.com/images/flutter/2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 85,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.itying.com/images/flutter/3.png'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }
}
