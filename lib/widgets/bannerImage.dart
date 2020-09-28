/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-28 13:15:24
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-28 13:26:29
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerImage extends StatelessWidget {
  final List<String> images = [
    "images/01.jpg",
    "images/05.jpg",
    "images/06.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: images.length,
          pagination: new SwiperPagination(),
    
        );
  }
}
