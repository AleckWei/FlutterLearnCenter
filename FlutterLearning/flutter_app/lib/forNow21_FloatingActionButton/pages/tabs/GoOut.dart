import 'package:flutter/material.dart';

class GoOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('发布'),
        ),
      ),
    );
  }
}
