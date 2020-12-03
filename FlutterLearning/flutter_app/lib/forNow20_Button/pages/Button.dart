import 'package:flutter/material.dart';
import 'package:flutter_app/forNow20_Button/pages/MyButton.dart';

class ButtonDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮演示页面'),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print('actions里面的button');
              })
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      print('普通按钮');
                    },
                    child: Text('普通按钮'),
                  ),
                  SizedBox(width: 5),
                  RaisedButton(
                    onPressed: () {
                      print('带颜色的按钮');
                    },
                    child: Text('带颜色的按钮',
                        style: TextStyle(color: Colors.blueGrey)),
                    color: Colors.lightBlueAccent,
                    textColor: Colors.indigo, // 这个属性的优先级没有textStyle的高
                  ),
                  SizedBox(width: 5),
                  RaisedButton(
                    onPressed: () {
                      print('有阴影的按钮');
                    },
                    child: Text('有阴影的按钮'),
                    elevation: 15.0, // 调节阴影呈现的宽度
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // 按钮本身是不能设置宽高的
                    // 但是可以用Container承载这个按钮，用Container的宽高去限制这个按钮的小
                    height: 50,
                    width: 350,
                    child: RaisedButton(
                      onPressed: () {
                        print('宽度高度');
                      },
                      child: Text('宽度高度'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    // 使用flex布局去实现按钮在某个方向上的自适应
                    flex: 1,
                    child: Container(
                      // 按钮本身是不能设置宽高的
                      // 但是可以用Container承载这个按钮，用Container的宽高去限制这个按钮的小
                      height: 100,
                      // width: 350,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: () {
                          print('自适应');
                        },
                        child: Text('自适应'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          label: Text('带图标的按钮')),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // 按钮本身是不能设置宽高的
                      // 但是可以用Container承载这个按钮，用Container的宽高去限制这个按钮的小
                      height: 50,
                      width: 350,
                      child: RaisedButton(
                        onPressed: () {
                          print('圆角按钮');
                        },
                        child: Text('圆角按钮'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // 按钮本身是不能设置宽高的
                      // 但是可以用Container承载这个按钮，用Container的宽高去限制这个按钮的小
                      height: 80,
                      child: RaisedButton(
                        onPressed: () {
                          print('圆形按钮');
                        },
                        child: Text('圆形按钮'),
                        splashColor: Colors.redAccent,
                        shape: CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.redAccent,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: FlatButton(
                          // 这个扁平化的按钮，在没有做出颜色区分的时候
                          // 是像一个文本一样的，没有边框那种凸出来的感觉
                          onPressed: () {
                            print('扁平按钮');
                          },
                          child: Text('扁平按钮'),
                          color: Colors.blue,
                        ),
                      ))
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // 按钮本身是不能设置宽高的
                      // 但是可以用Container承载这个按钮，用Container的宽高去限制这个按钮的小
                      height: 50,
                      width: 350,
                      margin: EdgeInsets.all(10),
                      child: OutlineButton(
                        // 只有一个边框一样的按钮
                        // 当中没有颜色的填充
                        onPressed: () {
                          print('Outline按钮');
                        },
                        child: Text('Outline按钮',
                            style: TextStyle(color: Colors.blue)),
                        color: Colors.red,
                        // 配置背景颜色是没有效果的，估计这个属性被屏蔽了
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('下面是ButtonBar'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonBar(
                            // 按钮组 组件
                            children: [
                              RaisedButton(
                                  onPressed: () {
                                    print('登录');
                                  },
                                  child: Text('登录')),
                              RaisedButton(
                                  onPressed: () {
                                    print('注册');
                                  },
                                  child: Text('注册')),
                            ]),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(width: 1, color: Colors.red)),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(left: 10, right: 10),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: MyButton(
                        text: 'MyButton组件',
                        height: 60,
                        perssed: () {
                          print('Hello?');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton');
              },
              child: Text('Hello?'),
            )
          ],
        ),
      ),
    );
  }
}
