import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hint3Page extends StatelessWidget {
  const Hint3Page({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: Colors.black.withValues(alpha: 0.5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 130.h + top,
                child: Image.asset(
                  'assets/png/state1.png',
                  width: 203.r,
                  height: 310.r,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 370.h + top,
                left: 18.w,
                child: Image.asset(
                  'assets/png/hint3.png',
                  width: 295.r,
                  height: 183.r,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
