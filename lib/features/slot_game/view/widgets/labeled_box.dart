import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../../core/core.dart';

class LabeledBox extends StatelessWidget {
  const LabeledBox({super.key, required this.title, required this.number});

  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 54.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: GradientBoxBorder(width: 2.sp, gradient: MyTheme.redGradient1),
        boxShadow: [
          BoxShadow(
            offset: Offset(8, 8),
            blurRadius: 10,
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return MyTheme.redGradient1.createShader(bounds);
            },
            child: Text(title, style: MyTextStyles.ma15_700),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return MyTheme.redGradient1.createShader(bounds);
                  },
                  child: Text(number.toString(), style: MyTextStyles.ma15_700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
