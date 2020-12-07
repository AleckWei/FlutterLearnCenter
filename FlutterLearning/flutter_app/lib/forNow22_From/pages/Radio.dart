import 'package:flutter/material.dart';

class RadioDemoPage extends StatefulWidget {
  @override
  _RadioDemoPageState createState() => _RadioDemoPageState();
}

class _RadioDemoPageState extends State<RadioDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
      ),
      body: Text('文本'),
    );
  }
}
