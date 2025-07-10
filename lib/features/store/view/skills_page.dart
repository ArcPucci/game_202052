import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';
import 'package:provider/provider.dart';

import '../../../common/logic/logic.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/core.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/main_bg_2.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: 330.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [LeftSideHomeButton(), RightSideMoneyCounter()],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 120.h),
                      child: Consumer<ConfigurationProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                          return Column(
                            children: [
                              SizedBox(height: 21.h),
                              Text("Skills", style: MyTextStyles.ma32_700),
                              SizedBox(height: 15.h),
                              Image.asset(
                                'assets/png/state5.png',
                                width: 203.r,
                                height: 310.r,
                                fit: BoxFit.fill,
                              ),
                              SkillCard(
                                title: 'Quick Reflexes',
                                description:
                                    "Increases the character's reaction\time to catch falling items",
                                price: 5000,
                                number: 0,
                                canBuy: true,
                              ),
                              SizedBox(height: 15.h),
                              SkillCard(
                                title: 'Extended Reach',
                                description:
                                    'Expands the radius within which\nthe character can catch items',
                                price: 10000,
                                number: 0,
                                canBuy: false,
                              ),
                              SizedBox(height: 15.h),
                              SkillCard(
                                title: 'Speed Boost',
                                description:
                                    "Enhances the character's\nmovement speed",
                                price: 10000,
                                number: 0,
                                canBuy: false,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
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
