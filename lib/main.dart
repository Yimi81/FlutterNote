/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-24 08:35:11
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-25 17:18:51
 */
import 'package:flutter/material.dart';
import 'package:flutternote/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Note',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      initialRoute: welcomeRoute, //欢迎页
      routes: routes,
    );
  }
}




