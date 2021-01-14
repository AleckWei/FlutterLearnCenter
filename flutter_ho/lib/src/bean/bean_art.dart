import 'package:flutter_ho/src/bean/bean_user.dart';

class ArtBean {
  // 文章ListTile的数据模型
  // 文章标题
  String artTitle = "";

  // 文章信息
  String artInfo = "";

  // 喜欢
  int likeCount = 0;

  // 评论
  int commentCount = 0;

  // 图片
  String image = "";

  String createTime;

  // 存储着作者名称的userBean
  UserBean userBean;

  ArtBean.fromMap(Map<String, dynamic> map) {
    this.artTitle = map["title"];
    this.artInfo = map["artInfo"];
    this.likeCount = map["readCount"];
    this.commentCount = map["pariseCount"];
    this.image = map["image"];
    this.createTime = map["createTime"];

    var bean = map["user"];
    if (bean != null) {
      // 如果传来的map里面存储着user这个bean
      // 就将它解析成对应的userBean
      userBean = UserBean.fromMap(bean);
    } else {
      userBean = new UserBean();
    }
  }
}
