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

    // 视频播放的实时更新
    _controller.addListener(() {
      if (_isPlay && !_controller.value.isPlaying) {
        _isPlay = false;
        setState(() {});
      }
      // 视频播放的当前时间
      Duration currentDuration = _controller.value.position;
      // 视频的总时长
      Duration totalDuration = _controller.value.duration;

      // 滑动条的进度
      if(currentDuration != null && totalDuration != null) {
        _currentSlider =
            currentDuration.inMicroseconds / totalDuration.inMicroseconds;
      }

      if (_opacity == 1.0) {
        _streamController.add(0);
      }
    });
  }

  @override
  void dispose() {
    // 页面销毁时，销毁一下视频控制器，释放一下资源
    _controller.dispose();
    _streamController.close();
    if (_timer !=null && _timer.isActive) {
      _timer.cancel();
    }
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
        buildControllerWidget(),
      ],
    );
  }

  Timer _timer;
  double _opacity = 1.0;
  bool _isFirst = true;

  Widget buildControllerWidget() {
    // 控制层最外层的动态显示/消失控件层
    return AnimatedOpacity(
      opacity: _opacity,
      // 过渡时间
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
          // 监听触摸，将控制层显示/隐藏
          setState(() {
            _opacity = _opacity == 1 ? 0 : 1;
          });
          HideControllerAfterTime(3000);
        },
        child: Stack(
          children: [
            // 控件中心的 播放/暂停 按钮
            Positioned.fill(
              child: Container(
                // 设置颜色以及透明度
                color: Colors.grey.withOpacity(0.4),
                child: GestureDetector(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.3),
                            ]),
                          ),
                          child: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow_sharp,
                            size: 33,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _opacity = 1;
                    });
                    if (_controller.value.isPlaying) {
                      endPlayVideo();
                    } else {
                      startPlayVideo();
                    }
                    HideControllerAfterTime(3000);
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
        ),
      ),
    );
  }

  ///开始播放视频
  void startPlayVideo() {
    _isPlay = true;
    // 当不是第一次播放时，进度条部分显示一个Container
    _isFirst = false;
    // 需要先全局暂停，再播放
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

  ///暂停播放视频
  void endPlayVideo() {
    _controller.pause();
    _isPlay = false;
  }

  ///进度条的百分比
  double _currentSlider = 0.0;
  StreamController _streamController = new StreamController();

  // 用于标识是返回播放中进度，还是返回视频总时长
  static bool playing = true;
  static bool total = false;

  Widget buildBottomController() {
    if (_isFirst) {
      // 当不是第一次播放时，进度条部分显示一个Container
      // 避免出现一开始空指针异常的情况
      return Container();
    }
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> currentSummary) {
      return Row(
        children: [
          Text(VideoTime(playing),
              style: TextStyle(fontSize: 14, color: Colors.white)),
          Expanded(
            child: Slider(
              // 滑动条当前的进度
              value: _currentSlider,
              // 滑动条滑动触发的回调
              onChanged: (value) {
                // value进度，相当于传了个%回来
                setState(() {
                  _currentSlider = value;
                  // 滑动条控制
                  _controller.seekTo(_controller.value.duration * value);
                  _opacity = 1;
                });
                HideControllerAfterTime(3000);
              },
              min: 0,
              max: 1,
              // 后面未播放进度的进度条的颜色
              inactiveColor: Colors.white,
              // 前面播放过的进度条的颜色
              activeColor: Colors.blueAccent,
            ),
          ),
          Text(VideoTime(total),
              style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      );
    });
  }

  ///在sec毫秒之后隐藏控制层
  // ignore: non_constant_identifier_names
  void HideControllerAfterTime(int sec) {
    if (_controller.value.isPlaying) {
      _timer = Timer(Duration(milliseconds: sec), () {
        setState(() {
          _opacity = 0;
        });
      });
    } else {
      if (_timer.isActive) {
        _timer.cancel();
      }
    }
  }

  ///返回时间的值
  // ignore: non_constant_identifier_names
  String VideoTime(bool playingOrTotal) {
    Duration duration;
    if (playingOrTotal) {
      duration = _controller.value.position;
    } else {
      duration = _controller.value.duration;
    }

    int m = 0;
    int s = duration.inSeconds; // 这里返回的是视频的总秒数

    if (s > 60) {
      m = (s ~/ 60).round(); //a~/b a÷b之后向下取整
      s = s % 60;
    }
    String mStr = '$m';
    String sStr = '$s';

    if (m < 10) {
      mStr = '0$m';
    }

    if (s < 10) {
      sStr = '0$s';
    }
    return '$mStr:$sStr';
  }
}
