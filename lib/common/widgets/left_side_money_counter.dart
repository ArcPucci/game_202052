import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/logic/logic.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';

class LeftSideMoneyCounter extends StatelessWidget {
  const LeftSideMoneyCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 151.r,
      height: 49.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () => context.go('/coins'),
              child: Container(
                width: 37.r,
                height: 31.r,
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
                padding: EdgeInsets.only(right: 9.r),
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/png/plus.png',
                  width: 14.r,
                  height: 14.r,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 22.r,
            child: Container(
              width: 98.r,
              height: 49.r,
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
                  BoxShadow(
                    offset: Offset(1, 0),
                    blurRadius: 4,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 32.r, right: 8.r),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Consumer<ConfigurationProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text("${value.bank}", style: MyTextStyles.ma16_700);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
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
