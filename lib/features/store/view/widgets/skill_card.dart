import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/widgets/bordered_button_1.dart';

import '../../../../core/core.dart';
import 'price_box.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.number,
    required this.canBuy,
    this.onBuy,
  });

  final String title;
  final String description;
  final int price;
  final int number;
  final bool canBuy;
  final VoidCallback? onBuy;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363.w,
      height: 175.h,
      decoration: BoxDecoration(
        gradient: MyTheme.redGradient2,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2.sp, color: Colors.white),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            right: 0,
            child: PriceBox(price: price, horizontal: 15.r, isStar: true),
          ),
          Positioned.fill(
            top: 28.h,
            left: 22.w,
            right: 22.w,
            bottom: 13.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: MyTextStyles.ma20_700),
                SizedBox(height: 7.h),
                Text(description, style: MyTextStyles.ma12_400),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 155.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2.sp, color: Colors.white),
                      ),
                      alignment: Alignment.center,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return MyTheme.redGradient1.createShader(bounds);
                        },
                        child: Text('$number', style: MyTextStyles.ma16_700),
                      ),
                    ),
                    BorderedButton1(text: "Buy", enabled: canBuy, onTap: onBuy),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
