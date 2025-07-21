import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features.dart';

class Hint2Page extends StatelessWidget {
  const Hint2Page({super.key, this.onTap});

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
                top: 420.h - 22.h - 201.r,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 17.r),
                      child: Image.asset(
                        'assets/png/hint2.png',
                        width: 339.r,
                        height: 201.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    Game1Button(),
                    SizedBox(height: 21.r),
                    SizedBox(
                      width: 331.r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Game2Button(),
                              SizedBox(height: 7.r),
                              Padding(
                                padding: EdgeInsets.only(right: 5.r),
                                child: LabeledButton3(label: 'Start'),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Game3Button(),
                              SizedBox(height: 7.r),
                              Padding(
                                padding: EdgeInsets.only(left: 5.r),
                                child: LabeledButton3(label: 'Start'),
                              ),
                            ],
                          ),
                        ],
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
