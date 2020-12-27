import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/home/list_item_widget.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:video_player/video_player.dart';

class HomeItemPage extends StatefulWidget {
  // 用于标识当前是哪个页面
  final int flag;

  HomeItemPage(this.flag);

  @override
  _HomeItemPageState createState() => _HomeItemPageState();
}

class _HomeItemPageState extends State<HomeItemPage> {
  // 创建一个多订阅流
  StreamController _streamController = StreamController.broadcast();

  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamController.stream.listen((event) {
      LogUtils.e('收到消息 ${event.textureId}');
      if (_videoPlayerController != null &&
          _videoPlayerController.textureId != event.textureId) {
        // 这里的意思是如果传过来的视频控制器，和当前的不一样，
        // 就将当前视频控制器控制的视频给暂停。
        _videoPlayerController.pause();
      }
      // 将全局控制器更新
      _videoPlayerController = event;
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  bool _isScroll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第 ${widget.flag} 个页面'),
      ),
      backgroundColor: Colors.grey[200],
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          Type runtimeType = notification.runtimeType;
          if (runtimeType == ScrollStartNotification) {
            LogUtils.e("开始滑动");
            _isScroll = true;
          } else if (runtimeType == ScrollEndNotification) {
            LogUtils.e("结束滑动");
            _isScroll = false;
          }
          setState(() {});
          return false;
        },
        child: ListView.builder(
          // 设置缓存的item数
          cacheExtent: 0,

          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return ListViewItemWidget(
              isScroll: _isScroll,
              streamController: _streamController,
            );
          },
        ),
      ),
    );
  }
}
