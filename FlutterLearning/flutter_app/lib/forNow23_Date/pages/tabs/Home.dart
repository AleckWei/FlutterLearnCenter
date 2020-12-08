import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/datePickerDemo');
            },
            child: Text('原生时间组件'),
          ),
          SizedBox(height: 20),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/datePickerPubDemo');
            },
            child: Text('第三方时间组件'),
          ),
        ],
      ),
    );
  }
}
