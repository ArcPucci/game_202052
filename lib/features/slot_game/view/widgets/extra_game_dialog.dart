import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';
import 'package:go_router/go_router.dart';

class ExtraGameDialog extends StatelessWidget {
  const ExtraGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Center(
          child: Container(
            width: 363.w,
            height: 290.h,
            decoration: BoxDecoration(
              gradient: MyTheme.redGradient1,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2.sp, color: Colors.white),
            ),
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Congratulations!", style: MyTextStyles.ma16_700),
                Text(
                  "You have won a bonus game. You\nhave 3 attempts to collect a bonus\ncombination in the slot. If you\nsucceed, you will receive a mega\nprize. If not, better luck next time.",
                  textAlign: TextAlign.center,
                  style: MyTextStyles.ma14_700,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.go('/slot/extra');
                  },
                  child: Container(
                    width: 265.w,
                    height: 46.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 0),
                          blurRadius: 4,
                          color: Colors.black.withValues(alpha: 0.25),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return MyTheme.redGradient1.createShader(bounds);
                      },
                      child: Text("Start", style: MyTextStyles.ma16_700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
