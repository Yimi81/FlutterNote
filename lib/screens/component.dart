/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-28 11:43:50
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-28 17:36:52
 */
import 'package:flutter/material.dart';
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Container(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '搜索 Flutter 组件',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.grey,
                        onPressed: () {
                          print('查找');
                        },
                      )),
                ),
              ),      

             /* SliverAppBar中有一个非常重要的参数flexibleSpace，flexibleSpace是SliverAppBar中展开和折叠区域，
             flexibleSpace与expandedHeight一起使用， expandedHeight表示flexibleSpace的高度，*/

              expandedHeight: 200,//拉伸高度
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title:Text('学习使我快乐'),
                background: Image.network(
                  'http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              child: _buildContent(),
            )
          ],
        ));
  }

  ListView _buildContent() {
    return ListView(
      children: [
        Card(
            child: CheWieListItem(
          videoController: VideoPlayerController.network(
              'http://119.23.62.18/Download/1.SafeArea.mp4'),
          looping: true,
        )),
      ],
    );
  }
}
