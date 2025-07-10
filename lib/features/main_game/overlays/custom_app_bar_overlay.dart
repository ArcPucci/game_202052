import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/widgets.dart';

class CustomAppBarOverlay extends StatelessWidget {
  const CustomAppBarOverlay({super.key, this.onTapHome});

  final VoidCallback? onTapHome;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 15.h,
          child: SafeArea(
            child: SizedBox(
              width: 320.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeftSideHomeButton(onTapHome: onTapHome),
                  RightSideStarCounter(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
