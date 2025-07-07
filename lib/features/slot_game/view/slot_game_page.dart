import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/widgets/widgets.dart';

class SlotGamePage extends StatelessWidget {
  const SlotGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/slot_game_bg.png', fit: BoxFit.fill),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: 330.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LeftSideHomeButton(),
                        RightSideMoneyCounter2(),
                      ],
                    ),
                  ),
                  SizedBox(height: 44.h),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/png/slot_bg.png',
                        width: 319.r,
                        height: 386.r,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
