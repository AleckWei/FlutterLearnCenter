import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/swiperPage');
            },
            child: Text('swiper轮播图'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/countPage');
            },
            child: Text('跑去计算故障码'),
          ),
        ],
      ),
    );
  }
}
