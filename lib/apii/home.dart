import 'package:hm_shop/constans/index.dart';
import 'package:hm_shop/utilss/dio.dart';
import 'package:hm_shop/viewmdoelss/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  try {
    // 1. 获取原始数据 (直接使用引用的全局 dioRequest 即可)
    final responseData = await dioRequest.get(HttpConstants.BANNER_LIST);

    // 2. 检查数据。responseData 可能为 null，所以加个 ? 判空
    if (responseData != null && responseData is List) {
      // 明确告诉 map 它要产出 BannerItem 类型的列表
      return responseData.map<BannerItem>((item) {
        // 3. 这里的转换非常关键
        return BannerItem.fromJson(item as Map<String, dynamic>);
      }).toList();
    } else {
      return [];
    }
  } catch (e) {
    // 捕获异常，打印日志，并给 UI 层返回空数组，避免页面崩溃
    // ignore: avoid_print
    print("获取轮播图API异常: $e");
    return [];
  }
}
