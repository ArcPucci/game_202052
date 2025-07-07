import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCup extends StatefulWidget {
  const AnimatedCup({
    super.key,
    required this.hasDice,
    this.goldDice = false,
    this.onInit,
    this.onTap,
  });

  final bool hasDice;
  final bool goldDice;
  final void Function(AnimationController)? onInit;
  final VoidCallback? onTap;

  @override
  State<AnimatedCup> createState() => _AnimatedCupState();
}

class _AnimatedCupState extends State<AnimatedCup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    widget.onInit?.call(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.hasDice)
          Positioned(
            bottom: 5.r,
            child: SizedBox(
              width: 48.r,
              height: 48.r,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_controller.isForwardOrCompleted && widget.goldDice)
                    Transform.scale(
                      scale: 2,
                      child: Image.asset(
                        'assets/png/lights1.png',
                        width: 95.r,
                        height: 95.r,
                      ),
                    ),
                  Image.asset(
                    widget.goldDice
                        ? 'assets/png/gold_dice.png'
                        : 'assets/png/red_dice.png',
                    width: 48.r,
                    height: 48.r,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.translate(
              offset: Offset(0, -53 * _controller.value),
              child: GestureDetector(
                onTap: widget.onTap,
                child: Image.asset(
                  'assets/png/glass.png',
                  width: 100.r,
                  height: 106.r,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
