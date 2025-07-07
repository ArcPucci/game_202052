import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/widgets/widgets.dart';
import 'package:game_202052/features/features.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/main_bg.png', fit: BoxFit.cover),
          ),
          Positioned(
            top: 109.h,
            child: Padding(
              padding: EdgeInsets.only(left: 35.r),
              child: Image.asset(
                'assets/png/ellipse1.png',
                width: 215.r * 1.3,
                height: 209.r * 1.3,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 109.h,
            child: Padding(
              padding: EdgeInsets.only(left: 25.r),
              child: Image.asset(
                'assets/png/greeting.png',
                width: 276.r * 1.1,
                height: 167.r * 1.1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 276.h,
            child: Column(
              children: [
                LabeledButton1(
                  label: "Settings",
                  onTap: () => context.go('/settings'),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: 320.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabeledButton2(
                        label: 'Skins',
                        onTap: () => context.go('/skins'),
                      ),
                      LabeledButton2(
                        label: 'Skills',
                        onTap: () => context.go('/skills'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21.r),
                Game1Button(),
                SizedBox(height: 21.r),
                SizedBox(
                  width: 331.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Game2Button(),
                          SizedBox(height: 7.r),
                          Padding(
                            padding: EdgeInsets.only(right: 5.r),
                            child: LabeledButton3(label: 'Start'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Game3Button(),
                          SizedBox(height: 7.r),
                          Padding(
                            padding: EdgeInsets.only(left: 5.r),
                            child: LabeledButton3(label: 'Start'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15.h,
            child: SafeArea(
              child: SizedBox(
                width: 330.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [LeftSideMoneyCounter(), RightSideStarCounter()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
