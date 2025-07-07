import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/widgets/bordered_button_1.dart';

import '../../../../core/core.dart';
import 'price_box.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363.w,
      height: 175.h,
      decoration: BoxDecoration(
        gradient: MyTheme.redGradient2,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2.sp, color: Colors.white),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            right: 0,
            child: PriceBox(price: 0, horizontal: 15.r),
          ),
          Positioned.fill(
            top: 28.h,
            left: 22.w,
            right: 22.w,
            bottom: 13.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quick Reflexes", style: MyTextStyles.ma20_700),
                SizedBox(height: 7.h),
                Text(
                  "Increases the character's reaction\ntime to catch falling items",
                  style: MyTextStyles.ma12_400,
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: BorderedButton1(text: "Set"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
