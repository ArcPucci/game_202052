import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features.dart';

class Game1Button extends StatelessWidget {
  const Game1Button({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.04,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Image.asset(
              'assets/png/game1_1.png',
              width: 331.r,
              height: 184.r,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 25.r,
              left: 40.r,
              child: Transform.scale(
                scale: 2.5,
                child: Image.asset(
                  'assets/png/ellipse2.png',
                  width: 171.r,
                  height: 140.r,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: 8.r,
              child: Image.asset(
                'assets/png/game1_2.png',
                width: 288.r,
                height: 184.r,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 12.w,
              bottom: 13.h,
              child: LabeledButton3(label: "Play"),
            ),
          ],
        ),
      ),
    );
  }
}
