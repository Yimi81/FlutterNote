/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-28 09:58:46
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-28 11:58:12
 */
import 'package:flutter/material.dart';
import 'package:flutternote/screens/component.dart';
import 'package:flutternote/screens/information.dart';
import 'package:flutternote/screens/myPage.dart';
import 'package:flutternote/screens/question.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [InforMation(), Component(), Question(), MyPage()];
  int _currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: Text('资讯'),
                icon: Icon(Icons.book),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                title: Text('组件'),
                icon: Icon(Icons.extension),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                title: Text('问题'),
                icon: Icon(Icons.question_answer),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                title: Text('我的'),
                icon: Icon(Icons.perm_identity),
                backgroundColor: Colors.blue),
          ],
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _changePage(index);
          },
        ),
        body: pages[_currentIndex],
      ),
    );
  }

  void _changePage(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
