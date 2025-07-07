import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';

class BorderedButton1 extends StatelessWidget {
  const BorderedButton1({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.onTap,
    this.enabled = true,
  });

  final double? width;
  final double? height;
  final String text;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Container(
          width: width ?? 155.w,
          height: height ?? 46.h,
          decoration: BoxDecoration(
            gradient: enabled ? MyTheme.redGradient1 : null,
            color: enabled ? null : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2.sp, color: Colors.white),
          ),
          alignment: Alignment.center,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (enabled) return Text(text, style: MyTextStyles.ma16_700);
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return MyTheme.redGradient1.createShader(bounds);
      },
      child: Text(text, style: MyTextStyles.ma16_700),
    );
  }
}
