import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CheckBoxDemoPage extends StatefulWidget {
  @override
  _CheckBoxDemoPageState createState() => _CheckBoxDemoPageState();
}

class _CheckBoxDemoPageState extends State<CheckBoxDemoPage> {
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CheckBox')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Checkbox(
                value: this._check,
                onChanged: (bool val) {
                  setState(() {
                    // this._check = !this._check;
                    this._check = val;
                    //  上面两行效果相同
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
