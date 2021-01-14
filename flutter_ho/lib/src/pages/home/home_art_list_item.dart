import 'package:flutter/material.dart';
import 'package:flutter_ho/src/bean/bean_art.dart';

class HomeItemArtWidget extends StatefulWidget {
  final ArtBean artBean;

  // // 文章名称
  // final String title;
  //
  // // 文章作者
  // final String author;
  //
  // // 文章的简介
  // final String content;
  //
  // // 右侧占位图的图片资源
  // final String imageUrl;

  HomeItemArtWidget({this.artBean});

  @override
  _HomeItemArtWidgetState createState() => _HomeItemArtWidgetState();
}

class _HomeItemArtWidgetState extends State<HomeItemArtWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 外边距
      margin: EdgeInsets.only(top: 4),
      // 内边距
      padding: EdgeInsets.only(left: 12, top: 12, bottom: 12),
      // 背景颜色
      decoration: BoxDecoration(
        // 线性渐变
        gradient: LinearGradient(
          // 从左上角到右下角的渐变
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.orangeAccent.withOpacity(0.5),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        // 包裹 内容
        mainAxisSize: MainAxisSize.min,
        // 子Widget左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          buildTitleContainer(),

          // 作者、文本内容Container
          buildMainBodyContainer(),

          // 评论
          buildCommentContainer(),
        ],
      ),
    );
  }

  // 标题
  Container buildTitleContainer() {
    return Container(
      child: Text(
        "${widget.artBean.artTitle}",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  // 作者、文本内容Container
  Container buildMainBodyContainer() {
    return Container(
      child: Row(
        children: [
          // 由于副标题的内容长度是不定可变的，
          // 这里使用一个expended容器去装
          // 让文字内容占据完剩余的空间
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5),
                // 作者
                buildAuthorNameContainer(),
                // 插入文本说明
                buildContentContainer(),
              ],
            ),
          ),
          // 右侧图片占位
          buildImageWidget(),
        ],
      ),
    );
  }

  // 装载作者名称的容器
  Container buildAuthorNameContainer() {
    return Container(
      child: Row(
        children: [
          Icon(Icons.forward_10),
          SizedBox(width: 10),
          Text(
            "${widget.artBean.userBean.userName}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff454645),
            ),
          ),
        ],
      ),
    );
  }

  // 加载图片的Container
  Container buildImageWidget() {
    return Container(
      // 外边距为10
      margin: EdgeInsets.all(10),
      // 圆角矩形裁剪
      child: ClipRRect(
        // 圆角设置为4
        borderRadius: BorderRadius.all(Radius.circular(4)),
        // 加载网络资源
        child: Image.network(
          "${widget.artBean.image}",
          width: 60,
          height: 60,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  // 文本说明Container
  Container buildContentContainer() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Text(
        "${widget.artBean.artInfo}",
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  // 评论Container
  Container buildCommentContainer() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text('${widget.artBean.likeCount}个点赞'),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 3,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
          ),
          Text('${widget.artBean.commentCount}条评论'),
        ],
      ),
    );
  }
}
