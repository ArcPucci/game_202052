import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/logic/logic.dart';
import 'package:game_202052/common/widgets/widgets.dart';
import 'package:game_202052/core/core.dart';
import 'package:game_202052/features/features.dart';
import 'package:provider/provider.dart';

class SkinsPage extends StatefulWidget {
  const SkinsPage({super.key});

  @override
  State<SkinsPage> createState() => _SkinsPageState();
}

class _SkinsPageState extends State<SkinsPage> {
  int _id = 0;

  @override
  void initState() {
    super.initState();
    _id = context.read<ConfigurationProvider>().state;
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Consumer<ConfigurationProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Material(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/png/main_bg_2.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 75.h + top, bottom: 120.h),
                  child: Column(
                    children: [
                      Text("Store", style: MyTextStyles.ma32_700),
                      SizedBox(height: 15.h),
                      Image.asset(
                        'assets/png/state${_id + 1}.png',
                        width: 203.r,
                        height: 310.r,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 367.w,
                        height: 474.h,
                        child: GridView.builder(
                          itemCount: SkinsRepository.skinModels.length,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 232.h,
                                mainAxisSpacing: 10.h,
                                crossAxisSpacing: 15.w,
                              ),
                          itemBuilder: (context, index) {
                            final skinModel = SkinsRepository.skinModels[index];
                            final isBought = value.boughtAccessories.contains(
                              skinModel.skin.id,
                            );
                            final canBuy = value.bank >= skinModel.skin.price;

                            return SkinCard(
                              skinModel: skinModel,
                              isBought: isBought,
                              canBuy: canBuy,
                              trySkin: () {
                                _id = index;
                                setState(() {});
                              },
                              setSkin: () async {
                                if (await value.setState(skinModel.skin)) {
                                  _id = index;
                                  setState(() {});
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15.h,
                child: SafeArea(
                  child: SizedBox(
                    width: 330.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [LeftSideHomeButton(), RightSideMoneyCounter()],
                    ),
                  ),
                ),
              ),
              _buildHint(value),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHint(value) {
    if (value.hints[2]) {
      return Positioned.fill(
        child: Hint3Page(onTap: () => value.completeHints(2)),
      );
    }

    if (value.hints[3]) {
      return Positioned.fill(
        child: Hint4Page(onTap: () => value.completeHints(3)),
      );
    }

    return SizedBox();
  }
}
