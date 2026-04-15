import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Main/Login/inedx.dart';
import 'package:hm_shop/pages/Main/index.dart';

//返回app组件
Widget getRootWidget() {
  return MaterialApp(initialRoute: "/", routes: getRootRoutes());
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => MainPage(), //主页

    "/login": (context) => LoginPage(), //登入页
  };
}
