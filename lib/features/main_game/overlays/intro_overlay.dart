import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';

import '../my_game.dart';

class IntroOverlay extends StatelessWidget {
  const IntroOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 120.h,
          left: -10.r,
          right: -10.r,
          child: SafeArea(
            child: Transform.scale(
              scale: 1.8,
              child: Image.asset('assets/images/ellipse2.png', height: 399.r),
            ),
          ),
        ),
        Positioned(
          top: 220.h,
          child: SafeArea(
            child: ValueListenableBuilder(
              valueListenable: game.gameManager.time,
              builder: (BuildContext context, int value, Widget? child) {
                return Text("$value", style: MyTextStyles.ma128_700);
              },
            ),
          ),
        ),
      ],
    );
  }
}
