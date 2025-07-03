import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Game2Button extends StatelessWidget {
  const Game2Button({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163.r,
      height: 110.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/game2_1.png', fit: BoxFit.fill),
          ),
          Transform.scale(
            scale: 3,
            child: Image.asset(
              'assets/png/ellipse4.png',
              width: 139.r,
              height: 120.r,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 3.r,
            child: Image.asset(
              'assets/png/game2_2.png',
              width: 121.r,
              height: 82.r,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
