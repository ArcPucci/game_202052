import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';

class LeftSideHomeButton extends StatelessWidget {
  const LeftSideHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.pop,
      child: SizedBox(
        width: 120.r,
        height: 49.r,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                width: 98.r,
                height: 49.r,
                decoration: BoxDecoration(
                  gradient: MyTheme.redGradient1,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 0),
                      blurRadius: 4,
                      color: Colors.black.withValues(alpha: 0.25),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(right: 13.r),
                alignment: Alignment.centerRight,
                child: Text("Home", style: MyTextStyles.ma16_700),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                width: 49.r,
                height: 49.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: MyTheme.redGradient1,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withValues(alpha: 0.25),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/png/home.png',
                  width: 29.r,
                  height: 29.r,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
