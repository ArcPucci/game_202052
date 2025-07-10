import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/core/theme/theme.dart';
import 'package:game_202052/features/features.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/loading_bg.png', fit: BoxFit.cover),
          ),
          Positioned(
            top: 633.h,
            child: Column(
              children: [
                CustomLoaderBox(onCompleted: () => context.go('/')),
                SizedBox(height: 10.h),
                Text("LOADING...", style: MyTextStyles.ab24_400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
