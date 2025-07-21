import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../../../core/core.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({super.key, this.onTap, required this.price});

  final String price;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 283.w,
        height: 82.h,
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            width: 2.sp,
            gradient: MyTheme.redGradient1,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(8, 8),
              blurRadius: 10,
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return MyTheme.redGradient1.createShader(bounds);
          },
          child: Text(price, style: MyTextStyles.ma32_700),
        ),
      ),
    );
  }
}
