import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({
    super.key,
    required this.price,
    this.horizontal,
    this.isStar = false,
  });

  final int price;
  final double? horizontal;
  final bool isStar;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      ),
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return MyTheme.redGradient1.createShader(bounds);
            },
            child: Text(price.toString(), style: MyTextStyles.ma16_700),
          ),
          SizedBox(width: 4.r),
          Padding(
            padding: EdgeInsets.only(bottom: isStar ? 5.r : 10.r),
            child:
                isStar
                    ? Image.asset(
                      'assets/png/star.png',
                      width: 30.r,
                      height: 27.r,
                      fit: BoxFit.fill,
                    )
                    : Image.asset(
                      'assets/png/coins.png',
                      width: 25.r,
                      height: 26.r,
                    ),
          ),
        ],
      ),
    );
  }
}
