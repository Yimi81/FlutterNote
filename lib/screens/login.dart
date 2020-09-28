/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-27 11:47:52
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-28 13:53:30
 */
import 'package:flutter/material.dart';
import 'package:flutternote/animations/FadeAnimations.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Timer _timer;
  int countdownTime = 0;
  //验证码倒计时
  startCountdown() {
    countdownTime = 60;
    final call = (timer) {
      setState(() {
        if (countdownTime < 1) {
          _timer.cancel();
        } else {
          countdownTime -= 1;
        }
      });
    };
    _timer = Timer.periodic(Duration(seconds: 1), call);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
                1.2,
                Text('登录',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold))),
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
                1.5,
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[300]))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: '请输入手机号'),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]))),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.grey.withOpacity(.8)),
                                      hintText: '验证码'),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  if (countdownTime == 0) {
                                    startCountdown();
                                  }
                                },
                                child: Text(
                                  countdownTime > 0
                                      ? countdownTime.toString()
                                      : '获取验证码',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color:
                                    Color.fromRGBO(3, 9, 23, 1).withOpacity(.9),
                              )
                            ],
                          )),
                    ],
                  ),
                )),
            SizedBox(height: 40),
            FadeAnimation(
                1.5,
                Center(
                  child: Container(
               
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffff1976d2)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: Text(
                        '登录/注册',
                        style: TextStyle(color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
