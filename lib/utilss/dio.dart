import 'package:dio/dio.dart';
import 'package:hm_shop/constans/index.dart'; // 引入你的全局常量
import 'package:hm_shop/constans/index.dart';

class DioRequest {
  final _dio = Dio();

  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstens.BASE_UPE
      ..connectTimeout = const Duration(seconds: GlobalConstens.TIME_OUT)
      ..receiveTimeout = const Duration(seconds: GlobalConstens.TIME_OUT);
  }

  // 1. 你的 get 方法
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    return await _handleResponse(_dio.get(url, queryParameters: params));
  }

  // 2. 你的统一响应处理函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;

      // 根据你定义的 GlobalConstants.SUCCESS_CODE 判断
      if (data["code"] == GlobalConstens.SUCCESS_CODE) {
        return data["result"]; // 直接返回业务需要的 result 部分
      }

      // 如果业务 code 错误，抛出后端给的提示语
      throw Exception(data["msg"] ?? "加载数据异常");
    } catch (e) {
      // 捕获网络错误或上面抛出的异常
      throw Exception(e);
    }
  }
}

// 【关键修复】实例化并导出单例，让其他文件可以直接使用 dioRequest.get
final dioRequest = DioRequest();
