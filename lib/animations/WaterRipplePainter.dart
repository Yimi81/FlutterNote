/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-27 12:54:21
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-27 14:16:53
 */
import 'dart:math';

import 'package:flutter/material.dart';

class WaterRipplePainter extends CustomPainter {
  final double progress;
  final int count; //水波纹数量
  final Color color;
  WaterRipplePainter(this.progress,
      {this.count = 1, this.color = const Color(0xffff1976d2)});

  Paint _paint = Paint()..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double radius = min(size.width / 2, size.height / 2);
    for (int i = count; i >= 0; i--) {
      final double opacity = (1.0 - ((i + progress) / (count + 1)));
      final Color _color = color.withOpacity(opacity);
      _paint..color = _color;

      double _radius = radius * ((i + progress) / (count + 1));

      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), _radius, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
