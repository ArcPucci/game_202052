import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../logic/configuration_provider.dart';

class RightSideStarCounter extends StatelessWidget {
  const RightSideStarCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104.r,
      height: 49.r,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 75.r,
              height: 49.r,
              decoration: BoxDecoration(
                gradient: MyTheme.redGradient1,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-8, 10),
                    blurRadius: 10,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ],
              ),
              padding: EdgeInsets.only(right: 19.r, left: 5.r),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Consumer<ConfigurationProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text("${value.stars}", style: MyTextStyles.ma16_700);
                  },
                ),
              ),
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
                    offset: Offset(-8, 10),
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
                'assets/png/star.png',
                width: 30.r,
                height: 27.r,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
