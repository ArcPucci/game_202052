import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features.dart';

class Hint1Page extends StatelessWidget {
  const Hint1Page({super.key, this.onTap});

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
              Positioned(
                top: 109.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.r),
                  child: Image.asset(
                    'assets/png/greeting.png',
                    width: 276.r * 1.1,
                    height: 167.r * 1.1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 276.h,
                child: Column(
                  children: [
                    LabeledButton1(label: "Settings"),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 320.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LabeledButton2(label: 'Skins'),
                          LabeledButton2(label: 'Skills'),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.only(right: 23.r),
                      child: Image.asset(
                        'assets/png/hint1.png',
                        width: 333.r,
                        height: 195.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
