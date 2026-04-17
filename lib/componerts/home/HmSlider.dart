import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmdoelss/home.dart';

class HmSliderpage extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSliderpage({super.key, required this.bannerList});

  @override
  State<HmSliderpage> createState() => _HmSliderpageState();
}

class _HmSliderpageState extends State<HmSliderpage> {
  Widget _getSlide() {
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
        );
      }),
      options: CarouselOptions(height: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlide()]);
    //Container(
    //   color: Colors.amber,
    //   width: 500,
    //   height: 200,
    //   alignment: Alignment.center,
    //   child: Text("轮播图", style: TextStyle(color: Colors.blue, fontSize: 50)),
    // );
  }
}
