import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ho/src/pages/play/video_details_widget.dart';

class ListViewItemWidget extends StatefulWidget {
  final StreamController streamController;
  final bool isScroll;

  ListViewItemWidget({
    this.streamController,
    this.isScroll = false,
  });

  @override
  _ListViewItemWidgetState createState() => _ListViewItemWidgetState();
}

class _ListViewItemWidgetState extends State<ListViewItemWidget> {
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
            child: buildVideoWidget(),
          )
        ],
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
      return VideoDetailWidget(
        streamController: widget.streamController,
      );
    }
  }
}
