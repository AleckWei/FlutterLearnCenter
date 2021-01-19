import 'package:flutter/material.dart';
import 'package:flutter_ho/src/bean/bean_art.dart';
import 'package:flutter_ho/src/net/dio_utils.dart';
import 'package:flutter_ho/src/net/http_helper.dart';
import 'package:flutter_ho/src/pages/home/home_art_list_item.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:flutter_ho/src/utils/toast_utils.dart';

class HomeItem3Page extends StatefulWidget {
  @override
  _HomeItem3PageState createState() => _HomeItem3PageState();
}

class _HomeItem3PageState extends State<HomeItem3Page> {
  List<ArtBean> _artBeanList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageIndex = 1;
    _pageSize = 2;
    // 在初始化页面时，先拉取一下数据
    loadingNetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的文章列表"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffCDDEEC),
      // 下拉刷新
      body: RefreshIndicator(
        // 懒加载
        child: ListView.builder(
          // 列表的个数（使用网络请求到参数）
          itemCount: _artBeanList.length,
          // 列表的子item的样式
          itemBuilder: (BuildContext context, int index) {
            // 这个子widget可以传入
            // 标题、作者、简介内容、右侧占位图资源
            // 根据实际需要去配置
            ArtBean artBean = _artBeanList[index];
            return HomeItemArtWidget(artBean: artBean);
          },
        ),
        onRefresh: () {
          return onRefresh();
        },
      ),
    );
  }

  int _pageIndex;
  int _pageSize;

  // 模拟加载网络资源里的artBean数据
  Future loadingNetData() async {
    // 添加分页请求
    Map<String, dynamic> pageMap = new Map();
    // 当前页数
    pageMap['pageIndex'] = _pageIndex;
    // 每页大小
    pageMap['pageSize'] = _pageSize;

    // 发起一个网络请求
    ResponseInfo responseInfo = await DioUtils.instance.getRequest(
      url: HttpHelper.artList,
      queryParameters: pageMap,
    );
    // 模拟网络请求返回的数据 （0.4s后返回数据）
    // ResponseInfo responseInfo =
    //     await Future.delayed(Duration(milliseconds: 400), () {
    //   return ResponseInfo(data: ListViewData);
    // });

    pageMap['pageIndex'] = _pageIndex + 1;

    if (responseInfo.success) {
      // 获取到的数据是一个list类型
      List<dynamic> list = responseInfo.data;
      // 清空一下数组
      _artBeanList = [];
      // 循环遍历请求到的数组，结果解析成一个个ArtBean
      list.forEach((element) {
        ArtBean artBean = new ArtBean.fromMap(element);
        // 解析的ArtBean存储到构建ListView的列表当中
        _artBeanList.add(artBean);
      });
      setState(() {});
    } else {
      ToastUtils.showToast('请求失败 ${responseInfo.message}');
    }
  }

  int _preLoadingTime = 0;

  // 下拉刷新功能
  Future<bool> onRefresh() async {
    // 记录开始加载的时间
    _preLoadingTime = DateTime.now().microsecond;
    // 加载数据
    await loadingNetData();
    // 加载完的时间
    int currentTime = DateTime.now().microsecond;
    // 时间差
    int loadingTime = currentTime - _preLoadingTime;
    // 控制1s内不再下拉刷新
    if (loadingTime < 1000) {
      await Future.delayed(Duration(milliseconds: 1000 - loadingTime));
    }
    // ToastUtils.showToast('已刷新');
    return true;
  }
}
