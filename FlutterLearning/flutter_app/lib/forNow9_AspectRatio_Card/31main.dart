import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import 'package:flutter_app/res/listData.dart';

// void main() {
//   runApp(MyApp());
// }

// Card当中使用ListTile对卡片进行设计
// 然后手动地写死2个卡片在listView当中

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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                    'https://www.itying.com/images/flutter/1.png',
                    fit: BoxFit.cover),
              ),
              ListTile(
                leading: CircleAvatar(
                  // 这个就是专门处理头像的组件
                  // Avatar音译过来是阿凡达的意思,也有作“头像”的引申义
                  backgroundImage: NetworkImage(
                      'https://www.itying.com/images/flutter/2.png'),
                ),
                title: Text('图片1'),
                subtitle: Text('图片1的各种描述'),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                    'https://www.itying.com/images/flutter/3.png',
                    fit: BoxFit.cover),
              ),
              ListTile(
                leading: ClipOval(
                  // 这个组件呢。。图片的处理比较鸡肋,这个处理的像椭圆
                  child: Image.network(
                    'https://www.itying.com/images/flutter/3.png',
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                  ),
                ),
                title: Text('图片1'),
                subtitle: Text('图片1的各种描述'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
