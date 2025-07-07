import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/widgets/widgets.dart';
import 'package:game_202052/core/core.dart';
import 'package:game_202052/features/features.dart';

class SkinsPage extends StatelessWidget {
  const SkinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/main_bg_2.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 75.h + top, bottom: 120.h),
              child: Column(
                children: [
                  Text("Store", style: MyTextStyles.ma32_700),
                  SizedBox(height: 15.h),
                  Image.asset(
                    'assets/png/state2.png',
                    width: 203.r,
                    height: 310.r,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 367.w,
                    height: 474.h,
                    child: GridView.builder(
                      itemCount: SkinsRepository.skinModels.length,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 232.h,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 15.w,
                      ),
                      itemBuilder: (context, index) {
                        final skinModel = SkinsRepository.skinModels[index];
                        return SkinCard(skinModel: skinModel);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15.h,
            child: SafeArea(
              child: SizedBox(
                width: 330.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [LeftSideHomeButton(), RightSideMoneyCounter()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
