import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';

import '../my_game.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        color: Colors.black.withValues(alpha: 0.5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 115.h,
              left: -31.r,
              right: -31.r,
              child: SafeArea(
                child: Transform.scale(
                  scale: 1.5,
                  child: Image.asset(
                    'assets/images/ellipse2.png',
                    height: 438.r,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 115.h,
              child: SafeArea(
                child: Image.asset(
                  'assets/images/game_over.png',
                  width: 314.r,
                  height: 420.r,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 525.h,
              child: SafeArea(
                child: GestureDetector(
                  onTap: game.retry,
                  child: Container(
                    width: 287.w,
                    height: 74.h,
                    decoration: BoxDecoration(
                      gradient: MyTheme.redGradient1,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2.sp, color: Colors.white),
                    ),
                    alignment: Alignment.center,
                    child: Text("Retry", style: MyTextStyles.ma24_700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
