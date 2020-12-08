import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerPubDemo extends StatefulWidget {
  @override
  _DatePickerPubDemoState createState() => _DatePickerPubDemoState();
}

class _DatePickerPubDemoState extends State<DatePickerPubDemo> {
  static const String MIN_DATETIME = '1980-05-12'; // 日期选择器最早时间
  static const String MAX_DATETIME = '2100-12-25'; // 日期选择器最晚时间

  bool _showTitle = true; // 是否显示标题
  DateTime _dateTime = DateTime.now(); // 初始日期为当前
  DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn; // 语言设置为中文

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
          showTitle: _showTitle,
          // title: Text('请选择时间',
          //     style: TextStyle(color: Theme.of(context).accentColor)),
          confirm: Text('确定', style: TextStyle(color: Colors.blue)),
          cancel: Text('取消', style: TextStyle(color: Colors.red))),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _dateTime,

      dateFormat: 'yyyy 年 MM 月 dd 日    EEE, H 时 : m 分',
      pickerMode: DateTimePickerMode.time,

      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      // onChange: (dateTime, List<int> index) {
      //   setState(() {
      //     _dateTime = dateTime;
      //   });
      // },
      onConfirm: (dateTime, List<int> index) {
        print(dateTime);
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期选择'),
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
                    Text(formatDate(this._dateTime,
                        [yyyy, ' - ', mm, ' - ', dd, '   ', HH, ' : ', nn])),
                    // Text('2020 - 12 - 08'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onTap: this._showDatePicker,
              )
            ],
          )
        ],
      ),
    );
  }
}
