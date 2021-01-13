import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ho/src/net/log_interceptor.dart';
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

  // 网络代理端口
  String proxyPort = "8888"; // 和ip同理

  DioUtils._internal() {
    BaseOptions options = new BaseOptions();
    // 设置请求、发送、连接超时时间
    options.connectTimeout = 20000; // 20s
    options.receiveTimeout = 2 * 60 * 1000; // 2min
    options.sendTimeout = 2 * 60 * 1000; // 2min

    // 初始化
    _dio = new Dio(options);

    // inProduction：
    // 当为debug、profile环境时，为false
    // 当为release环境时，为true
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
    _dio.interceptors.add(LogsInterceptors());

    // 配置代理
    if (isProxy) {
      _setupPROXY();
    }
  }

  // 配置代理（这里的作用主要是用于给主机抓包使用的）
  void _setupPROXY() {
    // 指定ip和端口
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
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
  ///[url]请求的链接
  ///[queryParameters] 请求参数
  ///[cancelTag] 取消网络请求的标识
  // ignore: missing_return
  Future<ResponseInfo> getRequest(
      {@required String url,
      Map<String, dynamic> queryParameters,
      CancelToken cancelTag}) async {
    try {
      _dio.options = await buildOptions(_dio.options);
      _dio.options.headers["content-type"] = "application/json";
      Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelTag,
      );
      dynamic responseData = response.data;
      if (responseData is Map<String, dynamic>) {
        Map<String, dynamic> responseMap = responseData;
        int code = responseMap["code"];
        if (code == 200) {
          // 业务代码处理正常
          dynamic data = responseMap["data"];
          return ResponseInfo(data: data);
        } else {
          // 业务代码处理异常
          return ResponseInfo.error(
            code: responseMap["code"],
            message: responseMap["message"],
          );
        }
      }
    } catch (e, s) {
      return errorController(e, s);
    }
  }

  ///post请求
  ///[url]请求链接
  ///[formDataMap]请求的参数
  ///[jsonMap]JSON格式的参数
  // ignore: missing_return
  Future<ResponseInfo> postRequest(
      {@required String url,
      Map<String, dynamic> formDataMap,
      Map<String, dynamic> jsonMap,
      CancelToken cancelTag}) async {
    FormData form;
    if (formDataMap != null) {
      form = FormData.fromMap(formDataMap);
    }

    _dio.options = await buildOptions(_dio.options);

    try {
      Response response = await _dio.post(
        url,
        data: form == null ? jsonMap : form,
        cancelToken: cancelTag,
      );
      dynamic responseData = response.data;
      if (responseData is Map<String, dynamic>) {
        Map<String, dynamic> responseMap = responseData;
        int code = responseMap["code"];
        if (code == 200) {
          // 业务代码处理正常
          dynamic data = responseMap["data"];
          return ResponseInfo(data: data);
        } else {
          // 业务代码处理异常
          return ResponseInfo.error(
            code: responseMap["code"],
            message: responseMap["message"],
          );
        }
      }
    } catch (e, s) {
      return errorController(e, s);
    }
  }

  Future<ResponseInfo> errorController(e, StackTrace s) {
    ResponseInfo responseInfo = new ResponseInfo();
    responseInfo.success = false;

    // 网络处理错误
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
          responseInfo.message = "响应错误";
          break;
        case DioErrorType.CANCEL:
          responseInfo.message = "已取消";
          break;
        case DioErrorType.DEFAULT:
          responseInfo.message = "网络请求错误";
          break;
      }
    } else {
      responseInfo.message = "其他错误";
    }
    return Future.value(responseInfo);
  }

  Future<BaseOptions> buildOptions(BaseOptions options) async {
    // 请求header的配置
    options.headers["productId"] = Platform.isAndroid ? "Android" : "IOS";
    options.headers["application"] = "coalx";

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
