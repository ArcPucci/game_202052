import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class CoinsCounter extends StatelessWidget {
  const CoinsCounter({
    super.key,
    this.increaseSum,
    this.decreaseSum,
    required this.number,
  });

  final int number;
  final VoidCallback? increaseSum;
  final VoidCallback? decreaseSum;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 268.r,
      height: 65.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: decreaseSum,
              child: Container(
                width: 49.r,
                height: 41.r,
                decoration: BoxDecoration(
                  gradient: MyTheme.redGradient1Reversed,
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
                padding: EdgeInsets.only(right: 3.r),
                child: SizedBox(
                  width: 32.r,
                  height: 32.r,
                  child: Center(
                    child: Image.asset(
                      'assets/png/minus.png',
                      width: 19.r,
                      height: 5.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: increaseSum,
              child: Container(
                width: 49.r,
                height: 41.r,
                decoration: BoxDecoration(
                  gradient: MyTheme.redGradient1,
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
                padding: EdgeInsets.only(left: 3.r),
                child: SizedBox(
                  width: 32.r,
                  height: 32.r,
                  child: Center(
                    child: Image.asset(
                      'assets/png/plus.png',
                      width: 19.r,
                      height: 19.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 186.r,
            height: 65.r,
            decoration: BoxDecoration(
              gradient: MyTheme.redGradient1Reversed,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 0),
                  blurRadius: 4,
                  color: Colors.black.withValues(alpha: 0.25),
                ),
                BoxShadow(
                  offset: Offset(8, 10),
                  blurRadius: 10,
                  color: Colors.black.withValues(alpha: 0.25),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$number", style: MyTextStyles.ma24_700),
                SizedBox(width: 3.r),
                Image.asset(
                  'assets/png/coins.png',
                  width: 38.r,
                  height: 39.r,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
