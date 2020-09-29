/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-28 11:43:40
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-29 17:10:58
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutternote/util/Colorsys.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200]),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top:15),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search),
                              color: Colors.grey,
                              onPressed: () {},
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Search'),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.camera_alt,color: Colors.grey[800],size:30)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(top:20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("热门资讯",style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.bold,fontSize: 22,letterSpacing: 1.2),),
                            Text("免责申明",style: TextStyle(color: Colors.orange),)
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 220,                      
                        child: BannerImage(),
                      ),
                      
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
