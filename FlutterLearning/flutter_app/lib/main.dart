import 'package:flutter/material.dart';
import 'res/listData.dart';

void main() {
  runApp(MyApp());
}

// GridView,使用GridView.builder去构建一个GridView
// 其实.builder方法相当于可以动态生成这个网格列表了

//自定义组件 == 创建一个类：
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 一般作为app的根组件
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: LayoutDemo(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  Widget _getListData(context, index) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(listData[index]['imageUrl']),
          SizedBox(height: 7), // 让图片和文字之间存在一定的距离
          Text(
            listData[index]['title'],
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(
          color: Color.fromRGBO(233, 233, 233, 0.9),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   crossAxisCount: 2,
    //   crossAxisSpacing: 10.0,
    //   // 水平元素之间的距离
    //   mainAxisSpacing: 10.0,
    //   // 垂直元素之间的距离
    //   padding: EdgeInsets.all(10),
    //   // childAspectRatio: 0.7, // 每一个GridView的宽比高的比例
    //   children: this._getListData(),
    // );
    return Container(
      padding: EdgeInsets.all(10),
      // 这里告诉我们,GridView.builder是没有padding这个属性的;
      // 如果要加上，最好就用一个Container去包住它，然后在其中设置padding属性
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            // 水平元素之间的距离
            mainAxisSpacing: 10.0,
            // 垂直元素之间的距离
          ),
          itemCount: listData.length,
          itemBuilder: this._getListData),
    );
  }
}
