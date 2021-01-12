class UserBean {
  // 用户的数据模型
  String userName;
  String userAge;

  UserBean.fromMap(Map<String, dynamic> map) {
    this.userName = map["userName"];
    this.userAge = map["age"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map["userName"] = this.userName;
    map["age"] = this.userAge;
    return map;
  }
}
