import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';

import '../../../../core/core.dart';

class SkinCard extends StatelessWidget {
  const SkinCard({
    super.key,
    required this.skinModel,
    this.isBought = false,
    this.trySkin,
    this.setSkin,
  });

  final bool isBought;
  final SkinModel skinModel;
  final VoidCallback? trySkin;
  final VoidCallback? setSkin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176.w,
      height: 232.h,
      decoration: BoxDecoration(
        gradient: MyTheme.redGradient2,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2.sp, color: Colors.white),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: skinModel.top,
            child: Padding(
              padding: EdgeInsets.only(left: skinModel.left),
              child: Image.asset(
                skinModel.skin.asset,
                width: skinModel.width,
                height: skinModel.height,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 20.r,
            right: 0,
            child: PriceBox(price: skinModel.skin.price),
          ),
          Positioned(
            left: 10.r,
            right: 10.r,
            bottom: 22.h,
            child: _buildButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (isBought) {
      return Center(
        child: GestureDetector(
          onTap: setSkin,
          child: Container(
            width: 75.w,
            height: 46.h,
            decoration: BoxDecoration(
              gradient: MyTheme.redGradient1,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2.sp, color: Colors.white),
            ),
            alignment: Alignment.center,
            child: Text("Set", style: MyTextStyles.ma16_700),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: trySkin,
          child: Container(
            width: 75.w,
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
              child: Text("Try", style: MyTextStyles.ma16_700),
            ),
          ),
        ),
        GestureDetector(
          onTap: setSkin,
          child: Container(
            width: 75.w,
            height: 46.h,
            decoration: BoxDecoration(
              gradient: MyTheme.redGradient1,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2.sp, color: Colors.white),
            ),
            alignment: Alignment.center,
            child: Text("Buy", style: MyTextStyles.ma16_700),
          ),
        ),
      ],
    );
  }
}
