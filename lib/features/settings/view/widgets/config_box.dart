import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/core.dart';

class ConfigBox extends StatelessWidget {
  const ConfigBox({
    super.key,
    required this.title,
    required this.onSwitch,
    this.enabled = true,
  });

  final String title;
  final void Function(bool) onSwitch;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322.w,
      height: 87.h,
      decoration: BoxDecoration(
        gradient: MyTheme.redGradient3,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2.sp, color: Colors.white),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 7.r),
            child: Text(title, style: MyTextStyles.ma20_700),
          ),
          Spacer(),
          BorderedButton1(
            text: "On",
            width: 81.w,
            enabled: enabled,
            onTap: () => onSwitch(true),
          ),
          SizedBox(width: 10.r),
          BorderedButton1(
            text: "Off",
            width: 81.w,
            enabled: !enabled,
            onTap: () => onSwitch(false),
          ),
        ],
      ),
    );
  }
}
