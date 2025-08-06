import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';

import '../../../common/widgets/widgets.dart';

class CustomAppBarOverlay extends StatelessWidget {
  const CustomAppBarOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 15.h,
          child: SafeArea(
            child: SizedBox(
              width: 320.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeftSideHomeButton(onTapHome: game.showConfirmation),
                  ValueListenableBuilder(
                    valueListenable: game.gameManager.score,
                    builder:
                        (context, value, child) =>
                            RightSideStarCounter(stars: value),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
