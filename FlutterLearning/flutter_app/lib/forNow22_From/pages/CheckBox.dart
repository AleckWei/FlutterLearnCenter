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
                value: this._check, // value是必须的
                onChanged: (bool val) {
                  setState(() {
                    // this._check = !this._check;
                    this._check = val;
                    //  上面两行效果相同
                  });
                },
                activeColor: Colors.green,
              ),
            ],
          ),
          Row(
            children: [
              Text(this._check ? "选中" : "未选中"),
            ],
          ),
          SizedBox(height: 40),
          CheckboxListTile(
            value: this._check,
            onChanged: (bool val) {
              setState(() {
                this._check = val;
              });
            },
            title: Text('标题'),
            subtitle: Text('二级标题'),
          ),
          Divider(),
          CheckboxListTile(
            value: this._check,
            onChanged: (bool val) {
              setState(() {
                this._check = val;
              });
            },
            title: Text('标题'),
            subtitle: Text('二级标题'),
            secondary: Icon(Icons.help_center_outlined),
          ),
        ],
      ),
    );
  }
}
