import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../common/widgets/widgets.dart';
import '../../../core/core.dart';

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF1419), Color(0xFF360001)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: LeftSideHomeButton(),
                ),
              ),
              SizedBox(height: 21.h),
              Text("Coins", style: MyTextStyles.ma32_700),
              SizedBox(height: 27.h),
              Image.asset(
                'assets/png/state6.png',
                width: 183.r,
                height: 193.r,
                fit: BoxFit.fill,
              ),
              CoinsCounter(),
              SizedBox(height: 40.h),
              PriceButton(),
              SizedBox(height: 15.h),
              Text(
                "Select the number of coins you want to purchase.\nDepending on the number of coins selected, the\npayment amount changes",
                textAlign: TextAlign.center,
                style: MyTextStyles.ma12_400.copyWith(
                  letterSpacing: -0.4,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
