import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features.dart';

class Hint4Page extends StatelessWidget {
  const Hint4Page({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
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
                top: 445.h + top,
                child: SizedBox(
                  width: 367.w,
                  height: 474.h,
                  child: GridView.builder(
                    itemCount: SkinsRepository.skinModels.length,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 232.h,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 15.w,
                    ),
                    itemBuilder: (context, index) {
                      final skinModel = SkinsRepository.skinModels[index];

                      return SkinCard(
                        skinModel: skinModel,
                        isBought: index == 0,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 250.h + top,
                left: 23.w,
                child: Image.asset(
                  'assets/png/hint4.png',
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
