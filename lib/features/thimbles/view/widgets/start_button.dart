import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.r),
        Image.asset(
          'assets/png/thimbles_man.png',
          width: 284.r,
          height: 225.r,
          fit: BoxFit.fill,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 287.w,
            height: 74.r,
            decoration: BoxDecoration(
              gradient: MyTheme.redGradient1,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2.sp, color: Colors.white),
            ),
            alignment: Alignment.center,
            child: Text("Start", style: MyTextStyles.ma24_700),
          ),
        ),
        SizedBox(height: 26.r),
      ],
    );
  }
}
