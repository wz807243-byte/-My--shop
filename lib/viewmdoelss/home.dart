class BannerItem {
  String id;
  String imgUrl;

  BannerItem({required this.id, required this.imgUrl});

  // 这里的工厂函数负责“单条”数据的转换
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json["id"]?.toString() ?? "", // 建议转一下 String，防止后端给数字
      imgUrl: json["imgUrl"] ?? "",
    );
  }
}
