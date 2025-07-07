import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/core.dart';

class CupBetCard extends StatelessWidget {
  const CupBetCard({
    super.key,
    this.bet = 0,
    this.onIncrease,
    this.onDecrease,
    this.onTapBet,
    this.canIncrease = true,
    this.canDecrease = true,
    this.active = true,
  });

  final int bet;
  final bool canIncrease;
  final bool canDecrease;
  final bool active;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onTapBet;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: active ? 1 : 0.5,
      child: SizedBox(
        width: 150.r,
        height: 168.r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150.r,
              height: 112.r,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 126.r,
                      height: 107.r,
                      decoration: BoxDecoration(
                        gradient: MyTheme.redGradient1,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(8, 8),
                            blurRadius: 10,
                            color: Colors.black.withValues(alpha: 0.25),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: 150.r,
                      height: 45.r,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 150.r,
                            height: 34.r,
                            decoration: BoxDecoration(
                              gradient: MyTheme.redGradient1,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 1.sp,
                                color: Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 4.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: onDecrease,
                                  child: Container(
                                    width: 26.r,
                                    height: 26.r,
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Opacity(
                                      opacity:
                                          (canDecrease && active) ||
                                                  (!canDecrease && !active)
                                              ? 1
                                              : 0.6,
                                      child: Image.asset(
                                        'assets/png/minus.png',
                                        width: 15.r,
                                        height: 2.r,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: onIncrease,
                                  child: Container(
                                    width: 26.r,
                                    height: 26.r,
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Opacity(
                                      opacity:
                                          (canIncrease && active) ||
                                                  (!canIncrease && !active)
                                              ? 1
                                              : 0.6,
                                      child: Image.asset(
                                        'assets/png/plus.png',
                                        width: 15.r,
                                        height: 15.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90.r,
                            height: 45.r,
                            decoration: BoxDecoration(
                              gradient: MyTheme.redGradient1,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 1.sp,
                                color: Colors.white,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1, 0),
                                  blurRadius: 4,
                                  color: Colors.black.withValues(alpha: 0.25),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('$bet', style: MyTextStyles.ma16_700),
                                Image.asset(
                                  'assets/png/coins.png',
                                  width: 18.r,
                                  height: 19.r,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12.r,
                    child: Image.asset(
                      'assets/png/glass.png',
                      width: 50.r,
                      height: 53.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            BorderedButton1(text: 'Bet', width: 132.r, onTap: onTapBet),
          ],
        ),
      ),
    );
  }
}
