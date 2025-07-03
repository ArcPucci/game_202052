import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class LabeledButton1 extends StatelessWidget {
  const LabeledButton1({super.key, required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 320.w,
        height: 54.h,
        decoration: BoxDecoration(
          gradient: MyTheme.redGradient1,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 2.sp, color: Colors.white),
          boxShadow: [
            BoxShadow(
              offset: Offset(8, 8),
              blurRadius: 10,
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(label, style: MyTextStyles.ma20_700),
      ),
    );
  }
}
