import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/widgets.dart';

class BombaGamePage extends StatefulWidget {
  const BombaGamePage({super.key});

  @override
  State<BombaGamePage> createState() => _BombaGamePageState();
}

class _BombaGamePageState extends State<BombaGamePage> {
  final bombs = [
    BombModel(top: 60.h, left: -80.w, angle: 18),
    BombModel(top: 70.h, right: 20.w, angle: -14, isLeft: false),
    BombModel(top: 230.h, right: -14.w),
    BombModel(top: 280.h, left: -20.w, angle: -14, isLeft: false),
    BombModel(top: 500.h, right: 20.w, angle: 18),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/bomba_game_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 15.h,
            child: SafeArea(
              child: SizedBox(
                width: 330.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [LeftSideHomeButton(), RightSideMoneyCounter2()],
                ),
              ),
            ),
          ),
          ...List.generate(bombs.length, (index) {
            final bomb = bombs[index];
            return Positioned(
              top: bomb.top,
              left: bomb.left,
              right: bomb.right,
              bottom: bomb.bottom,
              child: SafeArea(
                child: AnimatedBomb(
                  angle: bomb.angle,
                  left: bomb.isLeft,
                  onCompleted: () {
                    showResultDialog(context, 10000);
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  void showResultDialog(context, int win) {
    showDialog(
      context: context,
      builder: (context) {
        return MegaWinDialog(
          win: win,
          onTapContinue: context.pop,
          megaWin: false,
        );
      },
    );
  }
}
