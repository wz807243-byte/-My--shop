import 'package:flutter/material.dart';
import 'package:hm_shop/apii/home.dart';
import 'package:hm_shop/componerts/home/HmMoreList.dart';
import 'package:hm_shop/componerts/home/HmSlider.dart';
import 'package:hm_shop/componerts/home/Hmcategory.dart';
import 'package:hm_shop/viewmdoelss/home.dart';

class HomeVeiw extends StatefulWidget {
  const HomeVeiw({super.key});

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  List<BannerItem> _bannerlist = [
    // BannerItem(
    //   id: '1',
    //   imgUrl: 'https://picsum.photos/id/1/800/400', // 随机风景图1
    // ),
    // BannerItem(
    //   id: '2',
    //   imgUrl: 'https://picsum.photos/id/10/800/400', // 随机风景图2
    // ),
    // BannerItem(
    //   id: '3',
    //   imgUrl: 'https://picsum.photos/id/20/800/400', // 随机风景图3
    // ),
  ];
  List<Widget> _getScrollViewchilder() {
    return [
      SliverToBoxAdapter(child: HmSliderpage(bannerList: _bannerlist)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmcategorypage()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // SliverToBoxAdapter(
      // child: Padding(
      //   padding: const EdgeInsetsGeometry.symmetric(horizontal: 5),
      //   child: Flex(
      //     direction: Axis.horizontal,

      //     children: [
      //       Expanded(child: Hmhotpage()),
      //       SizedBox(width: 10),
      //       Expanded(child: Hmhotpage()),
      //     ],
      //   ),
      // ),
      // ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        sliver: const Hmmorelist(),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBanndrList();
  }

  void _getBanndrList() async {
    _bannerlist = await getBannerListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollViewchilder());
  }
}
