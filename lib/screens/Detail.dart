/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-29 14:09:05
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-29 14:50:57
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutternote/data/Sample.dart';
import 'package:flutternote/models/Post.dart';

class DetailDemo extends StatelessWidget {
  final Post post;
  final String image;

  const DetailDemo({Key key, this.post, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              height: height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black.withOpacity(.2)),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: AssetImage(post.user.profilePicture),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(post.user.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey[600].withOpacity(0.1)),
                            child: Center(
                              child: Image.asset('images/download.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/location.png',
                        scale: 2.2,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(post.location,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 13))
                    ],
                  ),
                  makeRelatedPhotos(post)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeRelatedPhotos(Post post) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      itemCount: post.relatedPhotos.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(post.relatedPhotos[index]))),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3 : 2),
    );
  }
}
