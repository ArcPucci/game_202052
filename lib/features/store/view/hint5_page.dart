import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../features.dart';

class Hint5Page extends StatelessWidget {
  const Hint5Page({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: Colors.black.withValues(alpha: 0.5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      SizedBox(height: 49.r),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(bottom: 120.h),
                          child: Column(
                            children: [
                              SizedBox(height: 21.h),
                              Text("Skills", style: MyTextStyles.ma32_700),
                              SizedBox(height: 15.h),
                              Image.asset(
                                'assets/png/state5.png',
                                width: 203.r,
                                height: 310.r,
                                fit: BoxFit.fill,
                              ),
                              SkillCard(
                                title: 'Quick Reflexes',
                                description:
                                    "Increases the character's reaction\time to catch falling items",
                                price: 5000,
                                number: 1,
                                canBuy: true,
                              ),
                              SizedBox(height: 15.h),
                              SkillCard(
                                title: 'Extended Reach',
                                description:
                                    'Expands the radius within which\nthe character can catch items',
                                price: 10000,
                                number: 1,
                                canBuy: false,
                              ),
                              SizedBox(height: 15.h),
                              SkillCard(
                                title: 'Speed Boost',
                                description:
                                    "Enhances the character's\nmovement speed",
                                price: 10000,
                                number: 1,
                                canBuy: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 70.h,
                child: Image.asset(
                  'assets/png/hint5.png',
                  width: 339.r,
                  height: 169.r,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
