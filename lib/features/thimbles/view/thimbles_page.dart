import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/widgets.dart';

class ThimblesPage extends StatelessWidget {
  const ThimblesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ThimblesController(Provider.of(context, listen: false));
      },
      child: Consumer<ThimblesController>(
        builder: (BuildContext context, value, Widget? child) {
          return Material(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/png/thimbles_bg.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        SizedBox(height: 15.h),
                        SizedBox(
                          width: 330.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LeftSideHomeButton(),
                              RightSideMoneyCounter2(),
                            ],
                          ),
                        ),
                        if (!value.isFinished) ...[
                          _buildBody(value),
                          SizedBox(
                            width: 320.r,
                            height: 356.r,
                            child: GridView.builder(
                              itemCount: 4,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 168.r,
                                    mainAxisSpacing: 20.r,
                                    crossAxisSpacing: 20.r,
                                  ),
                              itemBuilder: (context, index) {
                                return CupBetCard(
                                  canDecrease: value.canDecrease[index],
                                  canIncrease: value.canIncrease[index],
                                  active: value.canBet,
                                  onTapBet: value.nextRound,
                                  onIncrease: () => value.increaseBet(index),
                                  onDecrease: () => value.decreaseBet(index),
                                  bet: value.bets[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                if (value.isFinished)
                  Positioned(
                    top: 83.r,
                    child: SafeArea(child: AnimatedStar(onTap: value.initGame)),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(ThimblesController value) {
    if (!value.started) return StartButton(onTap: value.start);
    return Column(
      children: [
        SizedBox(height: 20.r),
        SizedBox(
          width: 270.r,
          height: 325.r,
          child: Stack(
            children: List.generate(value.cups.length, (index) {
              final cup = value.cups[index];
              return AnimatedPositioned(
                top: cup.top,
                left: cup.left,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.only(top: 53.r),
                  child: AnimatedCup(
                    hasDice: cup.hasDice,
                    goldDice: value.streak == 4,
                    onInit: (controller) => value.initCups(index, controller),
                    onTap: () => value.openCup(index),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
