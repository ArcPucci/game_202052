import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';

class MegaWinDialog extends StatefulWidget {
  const MegaWinDialog({
    super.key,
    required this.win,
    this.megaWin = true,
    this.onTapContinue,
  });

  final int win;
  final bool megaWin;
  final VoidCallback? onTapContinue;

  @override
  State<MegaWinDialog> createState() => _MegaWinDialogState();
}

class _MegaWinDialogState extends State<MegaWinDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final formatter = NumberFormat('###,###,###');

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          widget.onTapContinue?.call();
        },
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 58.r),
              child: SizedBox(
                width: 575.r,
                height: 575.r,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: -93.r,
                      right: -93.r,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget? child) {
                          return Transform.scale(
                            scale: _controller.value,
                            child: Image.asset(
                              widget.megaWin
                                  ? 'assets/png/mega_win.png'
                                  : 'assets/png/big_win.png',
                              width: 575.r,
                              height: 575.r,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 58.r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                "+${formatter.format(widget.win)}",
                                style: MyTextStyles.ma50_700,
                              ),
                              SizedBox(width: 8.w),
                              Image.asset(
                                'assets/png/coin.png',
                                width: 40.r,
                                height: 40.r,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Opacity(
                            opacity: 0.6,
                            child: Text(
                              "Tap to get!",
                              style: MyTextStyles.ma20_400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
