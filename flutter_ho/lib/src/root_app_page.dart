import 'package:flutter/material.dart';

import 'index_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 调试模式下去掉debug标签
      home: IndexPage(),
    );
  }
}
