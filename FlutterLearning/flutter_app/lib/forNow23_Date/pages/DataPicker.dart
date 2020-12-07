import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime _nowDate = DateTime.now();
  var _nowTime = TimeOfDay(hour: 12, minute: 00);

  _showDatePicker() {
    // 使用then方法接受回调值
    showDatePicker(
            // flutter当中的时间选择组件
            // 并且默认是英文的选择
            context: context,
            initialDate: this._nowDate,
            firstDate: DateTime(1980),
            lastDate: DateTime(2100))
        .then((value) {
      print(value);
    });
  }

  _showDatePicker1() async {
    // 使用async 和 await 的异步处理方法去获取这个回调
    var result = await showDatePicker(
        context: context,
        initialDate: this._nowDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2100));
    print(result);
    setState(() {
      this._nowDate = result;
    });
  }

  _showDatePicker2() {
    showTimePicker(context: context, initialTime: _nowTime).then((value) {
      setState(() {
        this._nowTime = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('当前的时间' + now.toString()); // 当前的时间2020-12-07 17:07:36.605995
    //
    // print('时间戳：  ' +
    //     now.millisecondsSinceEpoch
    //         .toString()); // I/flutter (15671): 时间戳：  1607332056605
    //
    // print('时间戳转换回来：' +
    //     DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch)
    //         .toString()); // 2020-12-07 17:07:36.605
    //
    // print('格式化时间(24小时制)：' +
    //     formatDate(
    //         now, [yyyy, '年', mm, '月', dd, '日--', HH, '时', nn, '分', ss, '秒']));
    // // 格式化时间：2020年12月07日--17时25分55秒
    // print('格式化时间(12小时制)：' +
    //     formatDate(
    //         now, [yyyy, '年', mm, '月', dd, '日--', hh, '时', nn, '分', ss, '秒']));
    // //  格式化时间：2020年12月07日--05时25分55秒
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Row(
                  children: [
                    Text(formatDate(this._nowDate, [yyyy, '-', mm, '-', dd])),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onTap: () {
                  print('打开日期组件');
                  _showDatePicker1();
                },
              ),
              InkWell(
                child: Row(
                  children: [
                    Text('${_nowTime.format(context)}'),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onTap: () {
                  print('打开日期组件');
                  _showDatePicker2();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
