import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';

class RightSideMoneyCounter2 extends StatelessWidget {
  const RightSideMoneyCounter2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 124.r,
      height: 49.r,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: 98.r,
            height: 49.r,
            decoration: BoxDecoration(
              gradient: MyTheme.redGradient1,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(8, 10),
                  blurRadius: 10,
                  color: Colors.black.withValues(alpha: 0.25),
                ),
                BoxShadow(
                  offset: Offset(1, 0),
                  blurRadius: 4,
                  color: Colors.black.withValues(alpha: 0.25),
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 12.r, right: 28.r),
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text("515000", style: MyTextStyles.ma16_700),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 49.r,
              height: 49.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: MyTheme.redGradient1,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(8, 10),
                    blurRadius: 10,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/png/coins.png',
                width: 25.r,
                height: 26.r,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
