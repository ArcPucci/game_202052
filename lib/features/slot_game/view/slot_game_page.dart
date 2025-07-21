import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/widgets/widgets.dart';
import 'package:game_202052/features/features.dart';
import 'package:provider/provider.dart';

class SlotGamePage extends StatelessWidget {
  const SlotGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SlotGameController(
          Provider.of(context, listen: false),
          () => showExtraGameDialog(context),
          (value) => showResultDialog(context, value),
        );
      },
      child: Consumer<SlotGameController>(
        builder: (BuildContext context, value, Widget? child) {
          return Material(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/png/slot_game_bg.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(height: 15.h),
                        SizedBox(
                          width: 330.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LeftSideHomeButton(
                                onTapHome: () => leaveDialog(context),
                              ),
                              RightSideMoneyCounter2(),
                            ],
                          ),
                        ),
                        SizedBox(height: 44.h),
                        CustomSlotMachine(
                          onInitSlot: value.initMachine,
                          onCompleted: value.checkResult,
                          items: SlotGameRepository.slotItems,
                        ),
                        SizedBox(height: 15.h),
                        SpinButton(
                          onSpin: value.spin,
                          canIncrease: value.canIncreaseBet,
                          canDecrease: value.canDecreaseBet,
                          onIncrease: value.increaseCurrentBet,
                          onDecrease: value.decreaseCurrentBet,
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 320.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LabeledBox(
                                title: 'Bet:',
                                number: value.currentBet,
                              ),
                              LabeledBox(
                                title: 'Last win:',
                                number: value.lastWin,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void showResultDialog(context, int win) {
    showDialog(
      context: context,
      builder: (context) {
        return MegaWinDialog(win: win);
      },
    );
  }

  void showExtraGameDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return ExtraGameDialog();
      },
    );
  }

  void leaveDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return LeaveDialog();
      },
    );
  }
}
