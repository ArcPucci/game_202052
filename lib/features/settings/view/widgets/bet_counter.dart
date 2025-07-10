import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/logic/logic.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';

class BetCounter extends StatelessWidget {
  const BetCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigurationProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Container(
          width: 322.w,
          height: 141.h,
          decoration: BoxDecoration(
            gradient: MyTheme.redGradient3,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2.sp, color: Colors.white),
          ),
          padding: EdgeInsets.only(top: 16.h, bottom: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Min. Bet", style: MyTextStyles.ma20_700),
              SizedBox(
                width: 210.r,
                height: 51.r,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      child: GestureDetector(
                        onTap: value.decreaseMinBet,
                        child: Container(
                          width: 39.r,
                          height: 33.r,
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
                            width: 25.r,
                            height: 25.r,
                            child: Center(
                              child: Image.asset(
                                'assets/png/minus.png',
                                width: 15.r,
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
                      child: GestureDetector(
                        onTap: value.increaseMinBet,
                        child: Container(
                          width: 39.r,
                          height: 33.r,
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
                            width: 25.r,
                            height: 25.r,
                            child: Center(
                              child: Image.asset(
                                'assets/png/plus.png',
                                width: 15.r,
                                height: 15.r,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 145.r,
                      height: 51.r,
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
                          Text("${value.minBet}", style: MyTextStyles.ma20_700),
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.r),
                            child: Image.asset(
                              'assets/png/coins.png',
                              width: 30.r,
                              height: 31.r,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
