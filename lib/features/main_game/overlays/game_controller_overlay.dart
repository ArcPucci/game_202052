import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';
import 'package:holding_gesture/holding_gesture.dart';

import '../my_game.dart';

class GameControllerOverlay extends StatelessWidget {
  const GameControllerOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 30.h,
          child: SafeArea(
            child: SizedBox(
              width: 307.r,
              height: 159.r,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: HoldDetector(
                      onTap: () {},
                      holdTimeout: Duration.zero,
                      onHold: game.onHoldLeftUp,
                      onCancel: game.onCancel,
                      behavior: HitTestBehavior.opaque,
                      child: Image.asset(
                        'assets/png/left_up.png',
                        width: 70.r,
                        height: 70.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: HoldDetector(
                      onTap: () {},
                      onHold: game.onHoldRightUp,
                      onCancel: game.onCancel,
                      child: Image.asset(
                        'assets/png/right_up.png',
                        width: 70.r,
                        height: 70.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: HoldDetector(
                      onTap: () {},
                      onHold: game.onHoldLeftDown,
                      onCancel: game.onCancel,
                      child: Image.asset(
                        'assets/png/left_down.png',
                        width: 70.r,
                        height: 70.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: HoldDetector(
                      onTap: () {},
                      onHold: game.onHoldRightDown,
                      onCancel: game.onCancel,
                      child: Image.asset(
                        'assets/png/right_down.png',
                        width: 70.r,
                        height: 70.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    width: 147.r,
                    height: 71.r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: game.openSkills,
                          child: Container(
                            width: 71.r,
                            height: 71.r,
                            decoration: BoxDecoration(
                              gradient: MyTheme.redGradient1,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(8, 8),
                                  blurRadius: 10,
                                  color: Colors.black.withValues(alpha: 0.25),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/png/storm.png',
                              width: 27.r,
                              height: 31.r,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: game.openInformation,
                          child: Container(
                            width: 71.r,
                            height: 71.r,
                            decoration: BoxDecoration(
                              gradient: MyTheme.redGradient1,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(8, 8),
                                  blurRadius: 10,
                                  color: Colors.black.withValues(alpha: 0.25),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/png/list.png',
                              width: 30.r,
                              height: 35.r,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
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
