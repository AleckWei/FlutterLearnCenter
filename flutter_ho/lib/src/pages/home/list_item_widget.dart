import 'package:flutter/material.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:video_player/video_player.dart';

class ListViewItemWidget extends StatefulWidget {
  @override
  _ListViewItemWidgetState createState() => _ListViewItemWidgetState();
}

class _ListViewItemWidgetState extends State<ListViewItemWidget> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Icon(Icons.one_k), Text('我是韦武浚')],
          ),
          SizedBox(height: 8),
          Container(
            height: 220,
            child: Stack(
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
            ),
          )
        ],
      ),
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
              _controller.play();
              _isPlay = true;
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
