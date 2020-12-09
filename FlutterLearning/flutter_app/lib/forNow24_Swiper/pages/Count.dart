import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var estate;
  List<int> _estateNum = [0, 0, 0, 0, 0, 0, 0, 0];
  String info = '';
  bool isNumFlag = true;

  _CounterPageState() {
    this._estateNum = [0, 0, 0, 0, 0, 0, 0, 0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('计算故障码'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                // 输入框
                TextField(
                  decoration: InputDecoration(
                    hintText: '请输入故障码（0 < x < 256）:',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) {
                    setState(() {
                      this.estate = val;
                      isInt(this.estate);
                    });
                  },
                ),
                SizedBox(height: 20),

                // 显示结果的区域
                Visibility(
                  visible: this.info != '',
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(this.info),
                        SizedBox(height: 10),
                        Visibility(
                            visible: this.isNumFlag,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text('bit7'),
                                        Text(this._estateNum[0].toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('bit6'),
                                        Text(this._estateNum[1].toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('bit5'),
                                        Text(this._estateNum[2].toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('bit4'),
                                        Text(this._estateNum[3].toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('bit3'),
                                        Text(this._estateNum[4].toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('bit2'),
                                        Text(this._estateNum[5].toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('bit1'),
                                        Text(this._estateNum[6].toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('bit0'),
                                        Text(this._estateNum[7].toString()),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            )),
                      ],
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: this.info != '', child: SizedBox(height: 20)),

                // 点击执行计算方法的按钮
                Container(
                  width: double.infinity,
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      print(this.estate);
                      CalculateEstate(isInt(this.estate));
                    },
                    child: Text('计算',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void CalculateEstate(int estate) {
    if (estate != -1) {
      print('CalculateEstate:' + estate.toString());
      setState(() {
        this._estateNum = [0, 0, 0, 0, 0, 0, 0, 0];
      });

      for (int i = 0; i < 8; i++) {
        int result = estate % 2;
        if (result == 1) {
          setState(() {
            this._estateNum[7 - i] = 1;
          });
          double res = estate / 2;
          estate = res.round() - 1; // 这个round函数是向上取整的，所以要减去1
        } else {
          double res = estate / 2;
          estate = res.round();
        }
      }
    }
  }

  int isInt(var estate) {
    try {
      int result = int.parse(estate);
      if (result > 255) {
        this.isNumFlag = false;
        this.info = '你输入的故障码太大了';
      } else if (result < 0) {
        this.isNumFlag = false;
        this.info = '你输入的故障码不能小于0';
      } else {
        this.isNumFlag = true;
        this.info = '故障码：' + result.toString();
      }
      return result;
    } on FormatException {
      print('请输入数字！');
      this.info = '请输入数字！';
      this.isNumFlag = false;
      return -1;
    }
  }
}
