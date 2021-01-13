class AppVersionBean {
  bool isNeed; // 是否需要升级
  String isForce; // 是否需要强制升级
  String updateContent; // 本次升级的说明文本
  String packageUrl; // 下载升级的安装包地址

  AppVersionBean.fromJson(Map<String, dynamic> map) {
    this.isNeed = map["isNeed"];
    this.isForce = map["isForce"];
    this.updateContent = map["updateContent"];
    this.packageUrl = map["packageUrl"];
  }
}
