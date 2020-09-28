/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-28 11:43:40
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-28 16:26:13
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutternote/widgets/bannerImage.dart';
import 'package:flutternote/widgets/myAppBar.dart';

class InforMation extends StatefulWidget {
  @override
  _InforMationState createState() => _InforMationState();
}

class _InforMationState extends State<InforMation> {
  final controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [Container(height: 200, child: BannerImage())],
      ),
    );
  }
}
