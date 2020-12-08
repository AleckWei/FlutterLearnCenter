import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var estate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('计算故障'),
        ),
        body: ListView(
          children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: []
        ])
  }
}

TextField(
decoration: InputDecoration(
hintText: "请输入255以下的数据故障码",
border: OutlineInputBorder(),
),
onChanged: (val) {
setState(() {
this.estate = val;
});
},
),

SizedBox(height: 20),

Container(
height: 50,
width: double.infinity,
child: FlatButton(
child: Text('计算'),
color: Theme
    .of(context)
.accentColor,
onPressed: () {
print(this.estate);
},
),
)