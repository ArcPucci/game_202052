import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedBomb extends StatefulWidget {
  const AnimatedBomb({
    super.key,
    this.left = true,
    required this.angle,
    this.hasGold = false,
    this.onCompleted,
    this.canTap = true,
    this.onTap,
  });

  final bool left;
  final int angle;
  final bool hasGold;
  final bool canTap;
  final VoidCallback? onTap;
  final VoidCallback? onCompleted;

  @override
  State<AnimatedBomb> createState() => _AnimatedBombState();
}

class _AnimatedBombState extends State<AnimatedBomb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _visibleBomb = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      upperBound: 1.5,
      lowerBound: 0.7,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 234.r,
      height: 234.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: widget.left ? 70.r : 40.r,
            bottom: 18.r,
            child: Image.asset(
              widget.hasGold
                  ? 'assets/png/place_with_gold.png'
                  : 'assets/png/place.png',
              width: 134.r,
              height: 100.r,
              fit: BoxFit.fill,
            ),
          ),
          if (_visibleBomb)
            Transform.rotate(
              angle: (-widget.angle * pi) / 180,
              child: GestureDetector(
                onTap: () async {
                  if (!widget.canTap) return;
                  widget.onTap?.call();
                  _controller.forward();
                  _visibleBomb = false;
                  setState(() {});

                  if (!widget.hasGold) return;
                  await Future.delayed(Duration(seconds: 2));
                  widget.onCompleted?.call();
                },
                child: Image.asset(
                  widget.left ? 'assets/png/bomb.png' : 'assets/png/bomb2.png',
                  width: 234.r,
                  height: 234.r,
                ),
              ),
            ),
          Visibility(
            visible: !_visibleBomb,
            child: Padding(
              padding: EdgeInsets.only(left: 30.r, bottom: 80.r),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: (1.5 - _controller.value).abs(),
                    child: Transform.scale(
                      scale: 1 + _controller.value,
                      child: Image.asset('assets/png/blow_up_2.png'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
