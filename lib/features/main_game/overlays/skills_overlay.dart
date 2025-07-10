import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/widgets/widgets.dart';
import 'package:game_202052/features/features.dart';

import '../../../core/core.dart';

class SkillsOverlay extends StatelessWidget {
  const SkillsOverlay(this.game, {super.key});

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
                        Text("Skills", style: MyTextStyles.ma16_700),
                        GestureDetector(
                          onTap: game.closeSkills,
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
                      padding: EdgeInsets.only(top: 32.h),
                      child: Column(
                        children: [
                          _SkillCard(
                            title: 'Quick Reflexes',
                            body:
                                "Increases the character's reaction time to catch falling items",
                            number: 3,
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: 293.w,
                            height: 1.sp,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20.h),
                          _SkillCard(
                            title: 'Extend Reach',
                            body:
                                "Expands the radius within which the character can catch items",
                            number: 3,
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: 293.w,
                            height: 1.sp,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20.h),
                          _SkillCard(
                            title: 'Speed Boost',
                            body: "Enhances the character's movement speed",
                            number: 3,
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

class _SkillCard extends StatelessWidget {
  const _SkillCard({
    required this.title,
    required this.body,
    required this.number,
    this.onTapUse,
  });

  final String title;
  final String body;
  final int number;
  final VoidCallback? onTapUse;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 289.w,
      height: 175.h,
      decoration: BoxDecoration(
        gradient: MyTheme.redGradient2,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2.sp, color: Colors.white),
      ),
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 27.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: MyTextStyles.ma20_700),
          Expanded(
            child: Center(child: Text(body, style: MyTextStyles.ma12_400)),
          ),
          SizedBox(height: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 88.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return MyTheme.redGradient1.createShader(bounds);
                  },
                  child: Text("$number", style: MyTextStyles.ma16_700),
                ),
              ),
              BorderedButton1(text: 'Use', width: 111.w, onTap: onTapUse),
            ],
          ),
        ],
      ),
    );
  }
}
