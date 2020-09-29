/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-28 11:43:50
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-29 14:47:18
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutternote/data/Sample.dart';
import 'package:flutternote/models/Post.dart';
import 'package:flutternote/screens/Detail.dart';
import 'package:flutternote/screens/componentDetail.dart';
import 'package:flutternote/util/Colorsys.dart';
import 'package:flutternote/widgets/chewieList.dart';
import 'package:flutternote/widgets/myAppBar.dart';
import 'package:video_player/video_player.dart';

class Component extends StatefulWidget {
  @override
  _ComponentState createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colorsys.lightGrey,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colorsys.darkGrey,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailDemo(),
            ));
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //顶部标题加搜索框
            searchBox(),
            SizedBox(
              height: 40,
            ),
            //底部标题
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "For you",
                    style: TextStyle(
                        color: Colorsys.darkGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colorsys.lightGrey))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Recommend',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colorsys.organge, width: 3))),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Likes",
                          style: TextStyle(
                              color: Colorsys.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //底部内容
                  makePost(Sample.postOne),
                  makePost(Sample.postTwo)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makePost(Post post) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ComponentDetail(user: post.user)));
            },
            child: Row(
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: post.user.username,
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: AssetImage(post.user.profilePicture),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.user.name,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            post.location,
                            style:
                                TextStyle(fontSize: 13, color: Colorsys.grey),
                          ),
                          Text(
                            post.dateAgo,
                            style:
                                TextStyle(fontSize: 13, color: Colorsys.grey),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: post.photos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailDemo(
                              post: post,
                              image: post.photos[index],
                            )));
                  },
                  child: AspectRatio(
                    aspectRatio: 1.2 / 1, //宽高比
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(post.photos[index]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[600]
                                                .withOpacity(0.1)),
                                        child: Center(
                                          child: Image.asset('images/link.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[600]
                                                .withOpacity(0.1)),
                                        child: Center(
                                          child:
                                              Image.asset('images/heart.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Best place to \nFind awesome photos",
            style: TextStyle(
                fontSize: 22,
                color: Colorsys.darkGrey,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(20, 3, 3, 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search for Photo',
                      hintStyle: TextStyle(color: Colorsys.grey),
                      border: InputBorder.none),
                )),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  minWidth: 50,
                  height: double.infinity,
                  elevation: 0,
                  color: Colorsys.organge,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
