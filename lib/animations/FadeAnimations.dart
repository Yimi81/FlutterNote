import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, tanslateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  FadeAnimation(this.delay, this.child);
  final _tween = MultiTween<AniProps>()
    ..add(AniProps.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
    ..add(AniProps.tanslateY, Tween(begin: -130.0, end: 0.0), 500.milliseconds,
        Curves.easeOut);
  @override
  Widget build(BuildContext context) {
    return PlayAnimation<MultiTweenValues<AniProps>>(
      tween: _tween,
      duration: _tween.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      child: child,
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(AniProps.opacity),
          child: Transform.translate(
              offset: Offset(0, value.get(AniProps.tanslateY)),
              child: child,
          ),
        );
      },
    );
  }
}
