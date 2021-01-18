import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ho/src/net/log_interceptor.dart';
import 'package:flutter_ho/src/utils/log_utils.dart';
import 'package:package_info/package_info.dart';

class DioUtils {
  Dio _dio;

  // 工厂模式
  factory DioUtils() => _getInstance();

  static DioUtils get instance => _getInstance();
  static DioUtils _instance;

  // 配置代理标识 false不配置
  bool isProxy = false;

  // 网络代理地址
  String proxyIp = "192.168.0.107"; // 这里后面学会了自己搭建服务器的时候再更换对应ip

  //网络代理端口
  String proxyPort = "8888"; // 和ip同理

  DioUtils._internal() {
    BaseOptions options = new BaseOptions();
    //请求时间
    options.connectTimeout = 8000;
    options.receiveTimeout = 2 * 60 * 1000;
    options.sendTimeout = 2 * 60 * 1000;
    // 初始化
    _dio = new Dio(options);
    //当App运行在Release环境时，inProduction为true；
    // 当App运行在Debug和Profile环境时，inProduction为false。
    bool inProduction = bool.fromEnvironment("dart.vm.product");
    if (!inProduction) {
      debugFunction();
    }
  }

  static DioUtils _getInstance() {
    if (_instance == null) {
      _instance = new DioUtils._internal();
    }
    return _instance;
  }

  void debugFunction() {
    // 添加log
    _dio.interceptors.add(LogsInterceptors());
    // 配置代理
    if (isProxy) {
      _setupPROXY();
    }
  }

  /// 配置代理
  void _setupPROXY() {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        //proxyIp 地址  proxyPort 端口
        return 'PROXY $proxyIp : $proxyPort';
      };

      // 忽略证书
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }

  ///get请求
  ///[url] 请求链接
  ///[queryParameters] 请求参数
  ///[cancelTag] 取消网络请求的标识
  // ignore: missing_return
  Future<ResponseInfo> getRequest(
      {@required String url,
      Map<String, dynamic> queryParameters,
      CancelToken cancelTag}) async {
    //发起get请求
    try {
      _dio.options = await buildOptions(_dio.options);
      _dio.options.headers["content-type"] = "application/json";
      Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelTag,
      );

      //响应数据，在这里将数据从json转换为map
      Map<String, dynamic> responseData = json.decode(response.data);
      LogUtils.e('响应数据' + responseData.toString());

      //数据解析
      if (responseData is Map<String, dynamic> && responseData != null) {
        int code = responseData["code"];
        if (code == 200) {
          //业务代码处理正常
          dynamic data = responseData["data"];
          return ResponseInfo(data: data);
        } else {
          //业务代码异常
          return ResponseInfo.error(
            code: responseData["code"],
            message: responseData["message"],
          );
        }
      }
    } catch (e, s) {
      //异常
      return errorController(e, s);
    }
  }

  /// post请求
  ///[url] 请求链接
  ///[formDataMap]formData 请求参数
  ///[jsonMap]JSON格式
  // ignore: missing_return
  Future<ResponseInfo> postRequest(
      {@required String url,
      Map<String, dynamic> queryParameters,
      CancelToken cancelTag}) async {
    _dio.options = await buildOptions(_dio.options);
    String data = json.encode(queryParameters);
    LogUtils.e('发送请求的参数：' + data);
    // _dio.options.headers["content-type"]="multipart/form-data";
    //发起post请求
    try {
      Response response = await _dio.post(
        url,
        cancelToken: cancelTag,
        queryParameters: queryParameters,
      );
      //响应数据
      Map<String, dynamic> responseData = json.decode(response.data);
      LogUtils.e('响应数据' + responseData.toString());
      // 响应数据{code: 200, data: {userName: wwj, age: 18}, message: }

      if (responseData is Map<String, dynamic> && responseData != null) {
        int code = responseData["code"];
        if (code == 200) {
          // 业务代码处理正常
          dynamic data = responseData["data"];
          return ResponseInfo(data: data);
        } else {
          // 业务代码处理异常
          return ResponseInfo.error(
            code: responseData["code"],
            message: responseData["message"],
          );
        }
      } else if (responseData == null) {
        return Future.value(ResponseInfo(success: false, message: '返回数据为空'));
      } else {
        return Future.value(
            ResponseInfo(success: false, message: responseData["message"]));
      }
    } catch (e, s) {
      return errorController(e, s);
    }
  }

  Future<ResponseInfo> errorController(e, StackTrace s) {
    ResponseInfo responseInfo = ResponseInfo();
    responseInfo.success = false;

    //网络处理错误
    if (e is DioError) {
      DioError dioError = e;
      switch (dioError.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          responseInfo.message = "连接超时";
          break;
        case DioErrorType.SEND_TIMEOUT:
          responseInfo.message = "请求超时";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          responseInfo.message = "响应超时";
          break;
        case DioErrorType.RESPONSE:
          // 响应错误
          responseInfo.message = "响应错误";
          break;
        case DioErrorType.CANCEL:
          // 取消操作
          responseInfo.message = "已取消";
          break;
        case DioErrorType.DEFAULT:
          // 默认自定义其他异常
          responseInfo.message = "网络请求异常";
          break;
      }
    } else {
      //其他错误
      responseInfo.message = "未知错误";
    }
    return Future.value(responseInfo);
  }

  Future<BaseOptions> buildOptions(BaseOptions options) async {
    ///请求header的配置
    options.headers["productId"] = Platform.isAndroid ? "Android" : "IOS";
    options.headers["application"] = "coalx";

    //获取当前App的版本信息
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    options.headers["appVersion"] = "$version";

    return Future.value(options);
  }
}

class ResponseInfo {
  bool success;
  int code;
  String message;
  dynamic data;

  ResponseInfo({
    this.success = true,
    this.code = 200,
    this.data,
    this.message = "请求成功",
  });

  ResponseInfo.error({
    this.success = false,
    this.code = 201,
    this.message = "请求异常",
  });
}
