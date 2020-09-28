/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-28 14:00:20
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-28 16:36:57
 */
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar>  {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
