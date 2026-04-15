import 'package:flutter/material.dart';
import 'package:hm_shop/pages/My/index.dart';
import 'package:hm_shop/pages/cart/index.dart';
import 'package:hm_shop/pages/category/index.dart';
import 'package:hm_shop/pages/home/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      "Icon": "lib/assets/ic_public_home_normal.png",
      "active_icon": "lib/assets/ic_public_home_active.png",
      "Text": "首页",
    },
    {
      "Icon": "lib/assets/ic_public_pro_normal.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "Text": " 分类",
    },
    {
      "Icon": "lib/assets/ic_public_cart_normal.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "Text": "购物车",
    },
    {
      "Icon": "lib/assets/ic_public_my_normal.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "Text": "我的",
    },
  ];
  int _currentIndex = 0;
  //返回底部的是个图标
  List<BottomNavigationBarItem> _getTabBarwidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["Icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["Text"],
      );
    });
  }

  List<Widget> _getChild() {
    return [HomeVeiw(), categoryView(), Cartview(), MyVeiw()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //避开安全区safearea
      body: SafeArea(
        child: IndexedStack(children: _getChild(), index: _currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black87,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,

        items: _getTabBarwidget(),
      ),
    );
  }
}
