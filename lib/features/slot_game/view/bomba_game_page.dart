import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/logic/logic.dart';
import 'package:game_202052/common/service/service.dart';
import 'package:game_202052/core/core.dart';
import 'package:game_202052/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/widgets.dart';

class BombaGamePage extends StatefulWidget {
  const BombaGamePage({super.key});

  @override
  State<BombaGamePage> createState() => _BombaGamePageState();
}

class _BombaGamePageState extends State<BombaGamePage> {
  bool _gameOver = false;
  int rand = 0;
  final bombs = [
    BombModel(top: 60.h, left: -80.w, angle: 18),
    BombModel(top: 70.h, right: 20.w, angle: -14, isLeft: false),
    BombModel(top: 230.h, right: -14.w),
    BombModel(top: 250.h, left: -20.w, angle: -14, isLeft: false),
    BombModel(top: 500.h, right: 20.w, angle: 18),
  ];
  int _failTry = 0;

  bool _hasHint = false;

  @override
  void initState() {
    super.initState();
    rand = Random().nextInt(bombs.length);
    _hasHint = context.read<ConfigurationService>().getBombHint();
  }

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
                  hasGold: rand == index,
                  canTap: !_gameOver,
                  onTap: () async {
                    if (rand == index) {
                      context.read<ConfigurationProvider>().addBank(10000);
                      _gameOver = true;
                      setState(() {});
                      return;
                    }

                    _failTry++;
                    if (_failTry == 3) {
                      _gameOver = true;
                      setState(() {});

                      await Future.delayed(Duration(seconds: 2));
                      context.pop();
                    }
                  },
                  onCompleted: () => showResultDialog(context, 10000),
                ),
              ),
            );
          }),
          if (_hasHint)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  _hasHint = false;
                  context.read<ConfigurationService>().setBombHint();
                  setState(() {});
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/png/bomb_bg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 500.h,
                      child: SafeArea(
                        child: Column(
                          children: [
                            Text(
                              "Welcome to the bonus\ngame!",
                              style: MyTextStyles.ma20_700,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Your task is to guess under which\nbutterfly your bonus is hidden in 3\nattempts. Tap on the butterfly to reveal\nwhat is hidden underneath.",
                              style: MyTextStyles.ma14_400,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
