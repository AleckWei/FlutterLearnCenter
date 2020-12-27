import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/play/video_details2_widget.dart';

class ListViewItem2Widget extends StatefulWidget {
  final StreamController streamController;
  final bool isScroll;

  ListViewItem2Widget({
    this.streamController,
    this.isScroll = false,
  });

  @override
  _ListViewItem2WidgetState createState() => _ListViewItem2WidgetState();
}

class _ListViewItem2WidgetState extends State<ListViewItem2Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Container(
        height: 220,
        child: buildVideoWidget(),
      ),
    );
  }

  Widget buildVideoWidget() {
    if (widget.isScroll) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/images/ic_mylove.png',
          fit: BoxFit.fitWidth,
        ),
      );
    } else {
      return VideoDetail2Widget(
        streamController: widget.streamController,
      );
    }
  }
}
