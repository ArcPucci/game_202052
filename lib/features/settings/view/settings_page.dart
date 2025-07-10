import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/logic/logic.dart';
import 'package:game_202052/common/widgets/widgets.dart';
import 'package:game_202052/core/core.dart';
import 'package:game_202052/features/features.dart';
import 'package:provider/provider.dart';

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
          child: Consumer<ConfigurationProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Column(
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
                  ConfigBox(
                    title: 'Music',
                    enabled: value.music,
                    onSwitch: value.toggleMusic,
                  ),
                  SizedBox(height: 20.h),
                  ConfigBox(
                    title: 'Sound',
                    enabled: value.sound,
                    onSwitch: value.toggleSound,
                  ),
                  SizedBox(height: 20.h),
                  BetCounter(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
