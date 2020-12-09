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
              Navigator.of(context).pushNamed('/dialogPage');
            },
            child: Text('前往dialog页面'),
          ),
        ],
      ),
    );
  }
}
