import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/widgets/widgets.dart';
import 'package:game_202052/core/core.dart';
import 'package:game_202052/features/features.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              Text("Settings", style: MyTextStyles.ma32_700),
              SizedBox(height: 60.h),
              ConfigBox(title: 'Music', onSwitch: (value) {}),
              SizedBox(height: 20.h),
              ConfigBox(title: 'Sound', onSwitch: (value) {}),
              SizedBox(height: 20.h),
              BetCounter(),
            ],
          ),
        ),
      ),
    );
  }
}
