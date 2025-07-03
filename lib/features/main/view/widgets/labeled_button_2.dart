import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class LabeledButton2 extends StatelessWidget {
  const LabeledButton2({super.key, required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 54.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: GradientBoxBorder(gradient: MyTheme.redGradient1, width: 2.sp),
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
        child: Text(label, style: MyTextStyles.ma20_700),
      ),
    );
  }
}
