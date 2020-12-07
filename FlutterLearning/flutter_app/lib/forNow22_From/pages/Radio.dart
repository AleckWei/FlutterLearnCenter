import 'package:flutter/material.dart';

class RadioDemoPage extends StatefulWidget {
  @override
  _RadioDemoPageState createState() => _RadioDemoPageState();
}

class _RadioDemoPageState extends State<RadioDemoPage> {
  int sex = 1;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Text('男'),
            //     Radio(
            //         value: 1,
            //         groupValue: this.sex,
            //         onChanged: (val) {
            //           setState(() {
            //             this.sex = val;
            //           });
            //         }),
            //     SizedBox(width: 20),
            //     Text('女'),
            //     Radio(
            //         value: 2,
            //         groupValue: this.sex,
            //         onChanged: (val) {
            //           setState(() {
            //             this.sex = val;
            //           });
            //         })
            //   ],
            // ),
            // Row(
            //   children: [
            //     Text('${this.sex}'),
            //     SizedBox(width: 20),
            //     Text(this.sex == 1 ? '男' : '女'),
            //   ],
            // ),
            SizedBox(height: 40),
            RadioListTile(
              value: 1,
              groupValue: this.sex,
              onChanged: (val) {
                setState(() {
                  this.sex = val;
                });
              },
              title: Text('男'),
              subtitle: Text('二级标题'),
              secondary:
                  Image.network('https://www.itying.com/images/flutter/3.png'),
              selected: this.sex == 1, // 这个属性是连带着文字标题一起选中高亮的
            ),
            SizedBox(height: 40),
            RadioListTile(
              value: 2,
              groupValue: this.sex,
              onChanged: (val) {
                setState(() {
                  this.sex = val;
                });
              },
              title: Text('女'),
              subtitle: Text('二级标题'),
              secondary:
                  Image.network('https://www.itying.com/images/flutter/2.png'),
              selected: this.sex == 2,
            ),
            Switch(
                value: this.flag,
                onChanged: (val) {
                  setState(() {
                    this.flag = val;
                    print(val);
                  });
                })
          ],
        ),
      ),
    );
  }
}
