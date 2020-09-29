/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-25 17:05:25
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-29 10:56:25
 */
/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-25 17:05:25
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-25 17:19:23
 */


import 'package:flutter/material.dart';
import 'package:flutternote/screens/componentDetail.dart';
import 'package:flutternote/screens/homePage.dart';
import 'package:flutternote/screens/welcome.dart';

const String welcomeRoute = "/welcome";
const String homeRoute = "/home";
const String compDetail = "/cptDetail";

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  welcomeRoute: (context) => Welcome(),//欢迎页
  homeRoute: (context) => HomePage(),//主界面
  compDetail: (context) => ComponentDetail(),//主界面
};
