import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';

import '../manager/game_manager.dart';
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
          top: 90.h,
          child: SafeArea(
            child: ValueListenableBuilder(
              valueListenable: game.gameManager.skillTimer,
              builder: (context, value, child) {
                if (value == 0) return SizedBox();
                final val = value.toString().padLeft(2, '0');
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/clock.png',
                      width: 18.r,
                      height: 18.r,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 8.r),
                    Text("00:$val", style: MyTextStyles.ma18_700),
                  ],
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 30.h,
          child: SafeArea(
            child: ValueListenableBuilder(
              valueListenable: game.gameManager.state,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value == MainGameState.paused ? 0.5 : 1,
                  child: ValueListenableBuilder(
                    valueListenable: game.gameManager.skillId,
                    builder: (BuildContext context, int value, Widget? child) {
                      final duration =
                          value == 0
                              ? Duration.zero
                              : Duration(milliseconds: 300);
                      return SizedBox(
                        width: 307.r,
                        height: 159.r,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              child: GestureDetector(
                                onTapDown: (details) {
                                  game.onHoldLeftUp();
                                },
                                onTapUp: (details) {
                                  game.onCancel();
                                },
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
                              child: GestureDetector(
                                onTapDown: (details) {
                                  game.onHoldRightUp();
                                },
                                onTapUp: (details) {
                                  game.onCancel();
                                },
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
                              child: GestureDetector(
                                onTapDown: (details) {
                                  game.onHoldLeftDown();
                                },
                                onTapUp: (details) {
                                  game.onCancel();
                                },
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
                              child: GestureDetector(
                                onTapDown: (details) {
                                  game.onHoldRightDown();
                                },
                                onTapUp: (details) {
                                  game.onCancel();
                                },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            color: Colors.black.withValues(
                                              alpha: 0.25,
                                            ),
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
                                            color: Colors.black.withValues(
                                              alpha: 0.25,
                                            ),
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
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
