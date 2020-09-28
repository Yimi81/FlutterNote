/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-25 17:06:42
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-28 09:16:03
 */
/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-25 17:06:42
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-27 10:07:58
 */
import 'package:flutter/material.dart';
import 'package:flutternote/animations/FadeAnimations.dart';
import 'package:flutternote/animations/WaterRipple.dart';
import 'package:flutternote/animations/WaterRipplePainter.dart';
import 'package:flutternote/screens/login.dart';
import 'package:page_transition/page_transition.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  //logo动画
  AnimationController _logoController;
  Animation _logoAnimation;

  //底部滑动条相关动画
  AnimationController _waterController;

  AnimationController _scaleController;
  AnimationController _scaleZController;
  AnimationController _widthController;
  AnimationController _positionController;
  AnimationController _scale2Controller;

  Animation<double> _scaleAnimation;
  Animation<double> _scaleZAnimation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;
  Animation<double> _scale2Animation;

  bool hideIcon = false;
  bool hideRipple = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _logoController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _logoAnimation = Tween(begin: 0.0, end: 1.0).animate(_logoController);
    _logoController.forward();

    _waterController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..repeat();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _scale2Animation = Tween<double>(begin: 1.0, end: 32.0).animate(
        _scale2Controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).push(
              PageTransition(type: PageTransitionType.fade, child: Login(),curve:Curves.fastOutSlowIn));
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _logoController.dispose();
    _waterController.dispose();
    _scaleController.dispose();
    _scaleZController.dispose();
    _widthController.dispose();
    _positionController.dispose();
    _scale2Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bottom = FadeAnimation(
      1.6,
      AnimatedBuilder(
        animation: _scaleController,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: Center(
            child: AnimatedBuilder(
              animation: _widthController,
              builder: (context, child) => Container(
                width: _widthAnimation.value,
                height: 80,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffff1976d2).withOpacity(.4)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      hideRipple = true;
                    });
                    _scaleController.forward();
                  },
                  child: Stack(
                    children: [
                      AnimatedBuilder(
                        animation: _positionController,
                        builder: (context, child) => Positioned(
                          left: _positionAnimation.value,
                          child: AnimatedBuilder(
                            animation: _scale2Animation,
                            builder: (context, child) => Transform.scale(
                              scale: _scale2Animation.value,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffff1976d2).withOpacity(.7)),
                                child: hideIcon == false
                                    ? Icon(Icons.arrow_forward,
                                        color: Colors.white)
                                    : Container(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: _logoAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(50.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/logo.jpg'),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Flutter Note',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        1.0,
                        Text(
                          "欢迎",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                      SizedBox(height: 15),
                      FadeAnimation(
                        1.3,
                        Text(
                          "这是一个了解、学习与共享Flutter相关信息的Flutter App",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.7), height: 1.4),
                        ),
                      ),
                      SizedBox(height: 150),
                      hideRipple == false
                          ? FadeAnimation(
                              2.0,
                              Center(
                                  child: Container(
                                      child: WaterRipple(
                                btn: bottom,
                              ))))
                          : bottom,
                      SizedBox(height: 60)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
