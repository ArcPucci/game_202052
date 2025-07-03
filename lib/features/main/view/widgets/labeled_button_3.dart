import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class LabeledButton3 extends StatelessWidget {
  const LabeledButton3({super.key, required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 139.w,
        height: 49.h,
        decoration: BoxDecoration(
          gradient: MyTheme.redGradient1,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 2.sp, color: Colors.white),
        ),
        alignment: Alignment.center,
        child: Text(label, style: MyTextStyles.ma24_700),
      ),
    );
  }
}
