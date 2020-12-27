import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:video_player/video_player.dart';

class VideoDetailWidget extends StatefulWidget {
  final StreamController streamController;

  VideoDetailWidget({this.streamController});

  @override
  _VideoDetailWidgetState createState() => _VideoDetailWidgetState();
}

class _VideoDetailWidgetState extends State<VideoDetailWidget> {
  // 创建视频播放的控制器
  VideoPlayerController _controller;

  // 是否需要隐藏控制层（当视频播放时，需要隐藏掉）
  bool _isPlay = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/list_item.mp4')
      ..initialize().then((_) {
        LogUtils.e("加载完成");
        setState(() {});
      });

    _controller.addListener(() {
      if (_isPlay && !_controller.value.isPlaying) {
        _isPlay = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // 页面销毁时，销毁一下视频控制器，释放一下资源
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //  第一层视频播放
        Positioned.fill(
          child: GestureDetector(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            onTap: () {
              _controller.pause();
              _isPlay = false;
              setState(() {});
            },
          ),
        ),

        //  第二层控制按钮
        buildController(),
      ],
    );
  }

  Widget buildController() {
    if (!_isPlay) {
      return Positioned.fill(
        child: Container(
          // 设置颜色以及透明度
          color: Colors.blueGrey.withOpacity(0.5),
          child: GestureDetector(
            child: Icon(Icons.play_circle_fill, size: 44),
            onTap: () {
              _isPlay = true;
              // 需要先暂停，再播放
              if (widget.streamController != null) {
                // 这里将item当中的视频控制器传给流控制器
                // 在根布局中就可以用全局流控制器来控制它们的暂停了
                widget.streamController.add(_controller);
              }
              _controller.play();
              setState(() {});
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
