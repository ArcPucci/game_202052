import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class CustomLoaderBox extends StatefulWidget {
  const CustomLoaderBox({super.key, this.onCompleted});

  final void Function()? onCompleted;

  @override
  State<CustomLoaderBox> createState() => _CustomLoaderBoxState();
}

class _CustomLoaderBoxState extends State<CustomLoaderBox> {
  double _progress = 0.12;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      final rand = Random().nextDouble() / 150;

      _progress += rand;
      setState(() {});

      if (_progress >= 1.00) {
        _progress = 1;
        setState(() {});

        _timer?.cancel();

        widget.onCompleted?.call();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Container(
        width: 330.w * _progress,
        height: 40.h,
        decoration: BoxDecoration(
          gradient: MyTheme.redGradient1,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 0),
              blurRadius: 4,
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
      ),
    );
  }
}
