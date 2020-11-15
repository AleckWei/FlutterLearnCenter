import 'package:flutter/material.dart';

class LayoutPractise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      // 第一个title的widget
      padding: const EdgeInsets.all(32.0), // 内边距32px
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 让列中的子项左对齐
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0), // 在底部填充8px
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      // 由于flutter的编译是由上自下的，所以下面的buttonWidget
      // 里面用的buildButtonColumn方法需要提前定义
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      // 第二个（3个并排）按钮的widget
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      // 第三个写入经典详情的widget
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the 
        Blüemlisalp in the Bernese Alps. 
        Situated 1,578 meters above sea level, 
        it is one of the larger Alpine Lakes. 
        A gondola ride from Kandersteg, 
        followed by a half-hour walk through pastures
         and pine forest, leads you to the lake, 
         which warms to 20 degrees Celsius in the summer. 
         Activities enjoyed here include rowing, 
         and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      // 最后，把上面定义的widget按list的顺序放进
      // 主体app的body当中
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter布局样例'),
        ),
        body: SingleChildScrollView(
          // 由于呈现的内容有可能会超过手机屏幕的长度
          // 这里就把主体内容放进一个ScrollView里面
          child: ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 120.0,
            ),
            child: Column(
              children: [
                Image.asset(
                  'images/lake.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                titleSection,
                buttonSection,
                textSection,
              ],
            ),
          ),
        ),
      ),

      // resizeToAvoidBottomPadding: false,
    );
  }
}
