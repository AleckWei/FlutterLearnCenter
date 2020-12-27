import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:video_player/video_player.dart';

class VideoDetail2Widget extends StatefulWidget {
  final StreamController streamController;

  VideoDetail2Widget({this.streamController});

  @override
  _VideoDetail2WidgetState createState() => _VideoDetail2WidgetState();
}

class _VideoDetail2WidgetState extends State<VideoDetail2Widget> {
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
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            // 设置颜色以及透明度
            color: Colors.blueGrey.withOpacity(0.5),
            child: GestureDetector(
              child: Icon(Icons.play_circle_fill, size: 44),
              onTap: () {
                startPlayVideo();
              },
            ),
          ),
        ),
        // 顶部对齐的文字
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          height: 44,
          child: Text(
            '帅么么',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        // 底部的滑动条
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          height: 60,
          child: buildBottomController(),
        ),
      ],
    );
  }

  ///开始播放视频
  void startPlayVideo() {
    _isPlay = true;
    // 需要先暂停，再播放
    if (widget.streamController != null) {
      // 这里将item当中的视频控制器传给流控制器
      // 在根布局中就可以用全局流控制器来控制它们的暂停了
      widget.streamController.add(_controller);
    }
    // 获取视频播放的进度
    Duration position = _controller.value.position;
    // 获取视频的总长度
    Duration length = _controller.value.duration;

    if (position == length) {
      // 当视频播放完毕之后，就将进度放回到视频的开头
      _controller.seekTo(Duration.zero);
    }
    // 开始播放视频
    _controller.play();
    setState(() {});
  }

  double _currentSlider = 0.0;

  Widget buildBottomController() {
    return Row(
      children: [
        Text('00:00', style: TextStyle(fontSize: 14, color: Colors.white)),
        Expanded(
          child: Slider(
            // 滑动条当前的进度
            value: _currentSlider,
            // 滑动条滑动触发的回调
            onChanged: (value) {
              setState(() {
                _currentSlider = value;
              });
            },
            min: 0,
            max: 1,
          ),
        ),
        Text('00:00', style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
