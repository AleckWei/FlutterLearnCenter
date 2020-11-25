import 'package:flutter/material.dart';
import 'package:flutter_app/res/MyContainer.dart';
import '../res/listData.dart';

// 如果在程序运行当中修改了import的文件
// 即非main.dart中的数据，就要把整个程序停掉然后重新运行

// void main() {
//   runApp(MyApp());
// }

// Card当中使用ListTile对卡片进行设计
// 这一部分用遍历的方法去读取listData当中的数据

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
      children: listData.map((value) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(value['imageUrl'], fit: BoxFit.cover),
              ),
              ListTile(
                leading: CircleAvatar(
                  // 这个就是专门处理头像的组件
                  // Avatar音译过来是阿凡达的意思,也有作“头像”的引申义
                  backgroundImage: NetworkImage(value['imageUrls']),
                ),
                title: Text(value['title']),
                subtitle: Text(
                  value['author'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
