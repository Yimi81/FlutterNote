/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-28 13:15:24
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-29 17:08:37
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerImage extends StatelessWidget {
  final List<String> images = [
    "images/flutter05.webp",
    "images/flutter02.webp",
    "images/flutter03.webp",
    "images/flutter04.webp"
  ];
  final List<String> description = [
    "为什么阿里巴巴、腾讯和Google之类的企业在使用Flutter开发 App?",
    "在伦敦举行的 Flutter Live 活动上，Google正式宣布了 Flutter 1.0",
    "",
    ""
  ];
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(images[index]), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                description[index],
                style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w800),
              )
            ],
          ),
        );
      },
      autoplay: true,
      itemCount: images.length,
      pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              size: 5,
              activeSize: 8,
              color: Colors.grey,
              activeColor: Colors.white)),
    );
  }
}
