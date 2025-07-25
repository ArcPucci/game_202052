import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';
import 'package:game_202052/features/features.dart';
import 'package:game_202052/features/main_game/data/data.dart';

class InformationOverlay extends StatelessWidget {
  const InformationOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        color: Colors.black.withValues(alpha: 0.25),
        child: Center(
          child: Container(
            width: 363.w,
            height: 590.h,
            decoration: BoxDecoration(
              gradient: MyTheme.redGradient1,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2.sp, color: Colors.white),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Column(
                children: [
                  SizedBox(
                    width: 303.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 16.r),
                        Text("Information", style: MyTextStyles.ma16_700),
                        GestureDetector(
                          onTap: game.closeInformation,
                          child: Image.asset(
                            'assets/png/close.png',
                            width: 16.r,
                            height: 16.r,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 32.h, left: 9.w),
                      child: Column(
                        children: [
                          ...List.generate(
                            MainGameRepository.fallingObjects.length - 2,
                            (index) {
                              final model =
                                  MainGameRepository.fallingObjects[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: _FallingItemCard(
                                  model: model,
                                  bonus:
                                      index ==
                                      MainGameRepository.fallingObjects.length -
                                          1,
                                ),
                              );
                            },
                          ),
                          Container(
                            width: 293.r,
                            height: 1.sp,
                            color: Colors.white,
                          ),
                          SizedBox(height: 15.h),
                          _FallingItemCard(
                            model: MainGameRepository.fallingObjects[5],
                            isBomb: true,
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            width: 293.r,
                            height: 1.sp,
                            color: Colors.white,
                          ),
                          SizedBox(height: 15.h),
                          _FallingItemCard(
                            model: MainGameRepository.fallingObjects[6],
                            bonus: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FallingItemCard extends StatelessWidget {
  const _FallingItemCard({
    super.key,
    required this.model,
    this.isBomb = false,
    this.bonus = false,
  });

  final FallingObjectModel model;
  final bool isBomb;
  final bool bonus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 294.r,
      height: 100.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100.r,
            height: 100.r,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.sp),
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/${model.asset}",
              width: 56.r,
              height: 65.r,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 179.r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isBomb ? "NEGATIVE ELEMENT" : "POSITIVE ELEMENT",
                  style: MyTextStyles.ma12_700.copyWith(
                    color:
                        isBomb
                            ? MyTheme.red1
                            : bonus
                            ? MyTheme.yellow2
                            : null,
                  ),
                ),
                SizedBox(height: 2.r),
                Text(
                  isBomb ? "Bomb" : "Commonly found ${model.name}",
                  style: MyTextStyles.ma12_400,
                ),
                SizedBox(height: 2.r),
                Row(
                  children: [
                    Text(
                      "Reward: ${model.isBomb ? "" : "+"}${model.reward}",
                      style: MyTextStyles.ma12_400,
                    ),
                    SizedBox(width: 2.r),
                    Image.asset(
                      'assets/png/star2.png',
                      width: 21.r,
                      height: 20.r,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
