import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class SpinButton extends StatelessWidget {
  const SpinButton({
    super.key,
    this.canIncrease = true,
    this.canDecrease = true,
    this.onSpin,
    this.onIncrease,
    this.onDecrease,
  });

  final bool canIncrease;
  final bool canDecrease;
  final VoidCallback? onSpin;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 264.r,
      height: 104.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Opacity(
              opacity: canDecrease ? 1 : 0.5,
              child: GestureDetector(
                onTap: onDecrease,
                child: Container(
                  width: 92.r,
                  height: 76.r,
                  decoration: BoxDecoration(
                    gradient: MyTheme.redGradient1Reversed,
                    border: Border.all(width: 1.sp, color: Colors.white),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(8, 10),
                        blurRadius: 10,
                        color: Colors.black.withValues(alpha: 0.25),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 45.r,
                    height: 45.r,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/png/minus.png',
                      width: 26.r,
                      height: 4.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Opacity(
              opacity: canIncrease ? 1 : 0.5,
              child: GestureDetector(
                onTap: onIncrease,
                child: Container(
                  width: 92.r,
                  height: 76.r,
                  decoration: BoxDecoration(
                    gradient: MyTheme.redGradient1,
                    border: Border.all(width: 1.sp, color: Colors.white),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(8, 10),
                        blurRadius: 10,
                        color: Colors.black.withValues(alpha: 0.25),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 45.r,
                    height: 45.r,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/png/plus.png',
                      width: 26.r,
                      height: 26.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onSpin,
            child: Container(
              width: 104.r,
              height: 104.r,
              decoration: BoxDecoration(
                gradient: MyTheme.redGradient1,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1.sp, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 0),
                    blurRadius: 4,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/png/spin.png',
                width: 53.r,
                height: 60.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
