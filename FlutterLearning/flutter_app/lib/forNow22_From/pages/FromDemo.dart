import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  @override
  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  String userName;
  int sex = 1;
  bool flag = false;
  List hobby = [
    {
      "checked": true,
      "title": "唱",
    },
    {
      "checked": false,
      "title": "跳",
    },
    {
      "checked": false,
      "title": "rape",
    },
    {
      "checked": false,
      "title": "篮球",
    },
  ];
  String Info = '';
  List<String> selectedHobby = [];

  _FormDemoPageState() {
    this.Info = '';
    for (var i = 0; i < this.hobby.length; i++) {
      if (this.hobby[i]['checked']) {
        selectedHobby.add(this.hobby[i]['title']);
      }
    }
  }

  List<Widget> _getHobby() {
    List<Widget> tempList = [];
    for (var i = 0; i < this.hobby.length; i++) {
      tempList.add(CheckboxListTile(
        value: this.hobby[i]['checked'],
        onChanged: (val) {
          setState(() {
            this.hobby[i]['checked'] = val;
            if (val) {
              selectedHobby.add(this.hobby[i]['title']);
            } else {
              selectedHobby.remove(this.hobby[i]['title']);
            }
          });
        },
        title: Text(this.hobby[i]['title']),
      ));
    }
    return tempList;
  }

  void setSex(val) {
    setState(() {
      this.sex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('信息登记系统'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "输入用户信息",
                  ),
                  onChanged: (val) {
                    setState(() {
                      this.userName = val;
                    });
                  },
                ),
                Row(
                  children: [
                    Text('男'),
                    Radio(
                        value: 1,
                        groupValue: this.sex,
                        onChanged: (v) {
                          setSex(v);
                        }),
                    Text('女'),
                    Radio(
                        value: 2,
                        groupValue: this.sex,
                        onChanged: (v) {
                          setSex(v);
                        }),
                    SizedBox(width: 130),
                    Switch(
                        value: this.flag,
                        onChanged: (bool val) {
                          setState(() {
                            this.flag = val;
                          });
                        })
                  ],
                ),

                // 爱好
                SizedBox(height: 20),
                Visibility(
                    visible: this.flag,
                    child: Column(
                      children: this._getHobby(),
                    )),

                // 描述
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: this.Info == '' ? '详细信息' : this.Info,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) {
                    setState(() {
                      this.Info = val;
                    });
                  },
                ),

                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: FlatButton(
                    child: Text('提交用户信息'),
                    onPressed: () {
                      print(this.sex == 1 ? '男' : '女');
                      print(this.selectedHobby.length != 0
                          ? selectedHobby.toString()
                          : '暂未选择喜好的兴趣');
                      print(this.userName != null ? this.userName : '暂未输入用户名');
                      print(this.Info != '' ? this.Info : '暂未输入详细信息');
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
