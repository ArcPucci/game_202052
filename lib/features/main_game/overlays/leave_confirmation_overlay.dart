import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../my_game.dart';

class LeaveConfirmationOverlay extends StatelessWidget {
  const LeaveConfirmationOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: Container(
          width: 363.w,
          height: 246.h,
          decoration: BoxDecoration(
            gradient: MyTheme.redGradient1,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2.sp, color: Colors.white),
          ),
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 32.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 16.r),
                  Text("Confirmation", style: MyTextStyles.ma16_700),
                  GestureDetector(
                    onTap: game.cancelLeave,
                    child: Image.asset(
                      'assets/png/close.png',
                      width: 16.r,
                      height: 16.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Center(
                  child: Text(
                    "Are you sure you want to exit the\ngame? All current progress will be\nlost.",
                    textAlign: TextAlign.center,
                    style: MyTextStyles.ma14_700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: game.cancelLeave,
                    child: Container(
                      width: 145.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: GradientBoxBorder(
                          gradient: MyTheme.redGradient1,
                          width: 2.sp,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return MyTheme.redGradient1.createShader(bounds);
                        },
                        child: Text("Cancel", style: MyTextStyles.ma16_700),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: context.pop,
                    child: Container(
                      width: 145.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        gradient: MyTheme.redGradient1,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2.sp, color: Colors.white),
                      ),
                      alignment: Alignment.center,
                      child: Text("Exit", style: MyTextStyles.ma16_700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
