import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmdoelss/home.dart';
import 'package:hm_shop/viewmdoelss/search_page.dart';

class HmSliderpage extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSliderpage({super.key, required this.bannerList});

  @override
  State<HmSliderpage> createState() => _HmSliderpageState();
}

int _cao = 0;

class _HmSliderpageState extends State<HmSliderpage> {
  // 正确：使用控制器类来初始化
  //定义页面绑定页面
  final CarouselSliderController _controller = CarouselSliderController();

  String _fallbackImageUrl(int index, {String? id}) {
    final seed = (id != null && id.isNotEmpty) ? id : index.toString();
    return 'https://picsum.photos/seed/$seed/800/400';
  }

  String _resolveBannerUrl(int index) {
    final item = widget.bannerList[index];
    final url = item.imgUrl.trim();
    return url.isEmpty ? _fallbackImageUrl(index, id: item.id) : url;
  }
  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Searchpage()),
            );
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 40,

            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("搜索", style: TextStyle(color: Colors.blueGrey)),
          ),
        ),
      ),
    );
  }

  Widget _getSlide() {
    final double screenwidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      //绑定页面
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (index) {
        final url = _resolveBannerUrl(index);
        return Image.network(
          url,
          fit: BoxFit.cover,
          width: screenwidth,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              _fallbackImageUrl(index, id: widget.bannerList[index].id),
              fit: BoxFit.cover,
              width: screenwidth,
            );
          },
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        onPageChanged: (index, reason) {
          _cao = index;
          setState(() {});
        },
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 10,
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 5000),
                margin: EdgeInsets.only(left: 10),
                width: _cao == index ? 40 : 20,
                height: 10,
                decoration: BoxDecoration(
                  color: _cao == index ? Colors.white : Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlide(), _getSearch(), _getDots()]);
    //Container(
    //   color: Colors.amber,
    //   width: 500,
    //   height: 200,
    //   alignment: Alignment.center,
    //   child: Text("轮播图", style: TextStyle(color: Colors.blue, fontSize: 50)),
    // );
  }
}
