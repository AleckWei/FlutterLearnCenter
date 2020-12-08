import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List<Map> imageList = [
    {"url": "https://www.itying.com/images/flutter/1.png"},
    {"url": "https://www.itying.com/images/flutter/2.png"},
    {"url": "https://www.itying.com/images/flutter/3.png"},
    {"url": "https://www.itying.com/images/flutter/4.png"},
    {"url": "https://www.itying.com/images/flutter/5.png"},
    {"url": "https://www.itying.com/images/flutter/6.png"},
    {"url": "https://www.itying.com/images/flutter/7.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播组件演示页面'),
      ),
      body: Column(
        children: [
          // 装有Swiper的Container
          Container(
            // height: 250,
            width: double.infinity,
            // 这个属性在下面这个aspectRatio没有生效的情况下
            // 可以让当中的内容的宽度铺满页面的宽度
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(imageList[index]["url"],
                      fit: BoxFit.fill);
                },
                itemCount: this.imageList.length,
                pagination: SwiperPagination(),
                // 这个是页面下面表示页码的小组件
                control: SwiperControl(),
                // 这个是可以控制页面左右的小箭头
                loop: false,
                // 是否可以循环轮播（这个属性必须在重新安装之后才起作用）
                // 但是设置了自动轮播之后，在播放到最后一个图片时，就会自动跳回第一张图
                autoplay: true,
                // 是否可以自动轮播
                autoplayDelay: 10000, // 切换下一张图片的时间间隔，单位：ms
              ),
            ),
          ),
          SizedBox(height: 10),

          // 轮播图说明文字
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('轮播图')],
          ),

          // 装有自定义Swiper的Container
          Container(
            child: AspectRatio(
              child: Swiper(
                layout: SwiperLayout.CUSTOM,
                customLayoutOption: new CustomLayoutOption(
                        startIndex: -1, stateCount: 3)
                    .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                  new Offset(-370.0, -40.0),
                  new Offset(0.0, 0.0),
                  new Offset(370.0, -40.0)
                ]),
                itemWidth: 300.0,
                itemHeight: 200.0,
                itemBuilder: (context, index) {
                  return new Container(
                    // color: Colors.grey,
                    child: new Center(
                      child: Image.network(this.imageList[index]["url"],
                          fit: BoxFit.contain),
                    ),
                  );
                },
                itemCount: this.imageList.length,
                pagination: SwiperPagination(),
                control: SwiperControl(),
                autoplay: true,
                autoplayDelay: 10000,
              ),
              aspectRatio: 16 / 9,
            ),
          ),
        ],
      ),
    );
  }
}
