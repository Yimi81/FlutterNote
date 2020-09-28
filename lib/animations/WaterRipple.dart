/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-27 13:23:30
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-27 14:18:04
 */
import 'package:flutter/material.dart';
import 'package:flutternote/animations/WaterRipplePainter.dart';

class WaterRipple extends StatefulWidget {
  final int count;
  final Color color;
  final Widget btn;
  const WaterRipple(
      {Key key,@required this.btn,this.count = 1, this.color = const Color(0xFF0080ff)})
      : super(key: key);

  @override
  _WaterRippleState createState() => _WaterRippleState();
}

class _WaterRippleState extends State<WaterRipple>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: WaterRipplePainter(_controller.value,
              count: widget.count, color: widget.color),
          child: Center(
            child: widget.btn
          ),
        );
      },
    );
  }
}
