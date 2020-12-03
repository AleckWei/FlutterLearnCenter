import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('消息'),
        ),
      ),
    );
  }
}
