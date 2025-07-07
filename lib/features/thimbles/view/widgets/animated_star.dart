import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';

class AnimatedStar extends StatefulWidget {
  const AnimatedStar({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<AnimatedStar> createState() => _AnimatedStarState();
}

class _AnimatedStarState extends State<AnimatedStar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 575.r,
        height: 575.r,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.scale(
                  scale: _controller.value,
                  child: Image.asset(
                    'assets/png/big_win.png',
                    width: 575.r,
                    height: 575.r,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
            Positioned(
              bottom: 58.r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text("+10,000", style: MyTextStyles.ma50_700),
                      SizedBox(width: 8.w),
                      Image.asset(
                        'assets/png/coin.png',
                        width: 40.r,
                        height: 40.r,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Opacity(
                    opacity: 0.6,
                    child: Text("Tap to get!", style: MyTextStyles.ma20_400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
