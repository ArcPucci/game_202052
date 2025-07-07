import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';

class CustomSlotMachine extends StatefulWidget {
  const CustomSlotMachine({
    super.key,
    required this.items,
    this.onInitSlot,
    this.onCompleted,
  });

  final List<RollingItem> items;
  final void Function(VoidCallback?)? onInitSlot;
  final void Function(int? comb)? onCompleted;

  @override
  State<CustomSlotMachine> createState() => _CustomSlotMachineState();
}

class _CustomSlotMachineState extends State<CustomSlotMachine> {
  final _functions = [];

  RollingItem? _item;
  int? _comb;
  int? _lastComb;

  @override
  void initState() {
    super.initState();
    widget.onInitSlot?.call(_spinReel);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/png/slot_bg.png', width: 319.r, height: 386.r),
        SizedBox(
          width: 289.r,
          height: 356.r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              return _RollingReel(
                id: index,
                item: _item,
                combination: _comb,
                lastCombination: _lastComb,
                reelItemsList: widget.items,
                onInitReel: (spin) => _functions.add(spin),
                onCompleted: (value) {
                  if (index != 3) return;
                  widget.onCompleted?.call(_comb);

                  _lastComb = _comb;
                  _item = null;
                  _comb = null;
                  setState(() {});
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  void _spinReel() {
    _lastComb = null;
    setState(() {});

    for (var fun in _functions) {
      fun();
    }

    final temp = List.generate(2, (index) => Random().nextBool());
    final chance = temp.every((e) => e);

    if (!chance) return;

    _comb = Random().nextInt(SlotGameRepository.allCombinations.length);

    if (_comb! < 2) {
      _item = widget.items[widget.items.length - 1];
    } else {
      final randIndex = Random().nextInt(widget.items.length - 1);
      _item = widget.items[randIndex];
    }

    setState(() {});
  }
}

class _RollingReel extends StatefulWidget {
  const _RollingReel({
    required this.id,
    this.onInitReel,
    required this.reelItemsList,
    this.onCompleted,
    this.item,
    this.combination,
    this.lastCombination,
  });

  final int id;
  final int? combination;
  final int? lastCombination;
  final RollingItem? item;
  final List<RollingItem> reelItemsList;
  final void Function(VoidCallback?)? onInitReel;
  final void Function(List<RollingItem>)? onCompleted;

  @override
  State<_RollingReel> createState() => _RollingReelState();
}

class _RollingReelState extends State<_RollingReel> {
  final _controller = FixedExtentScrollController();
  final _list = <List<RollingItem>>[];
  Timer? timer;
  int _lastId = 0;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      final subList = _generateResultList();
      _list.add(subList);
    }
    widget.onInitReel?.call(_start);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71.r,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 356.r,
        diameterRatio: 100,
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        childDelegate: ListWheelChildLoopingListDelegate(
          children: List.generate(_list.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 0.5.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_list[index].length, (subIndex) {
                  final item = _list[index][subIndex];
                  final isHG =
                      widget.lastCombination != null &&
                      SlotGameRepository.allCombinations[widget
                                  .lastCombination ??
                              0][subIndex][widget.id] ==
                          1;
                  return Container(
                    width: 70.r,
                    height: 70.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/png/slot_cell.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isHG)
                          Transform.scale(
                            scale: 1.2,
                            child: Image.asset(
                              'assets/png/lights1.png',
                              width: 70.r,
                              height: 70.r,
                              fit: BoxFit.fill,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.r),
                          child: Image.asset(
                            item.asset,
                            errorBuilder: (ctx, error, stack) {
                              return Image.asset(
                                item.asset,
                                width: 64.r,
                                height: 64.r,
                                fit: BoxFit.fill,
                              );
                            },
                            width: 64.r,
                            height: 64.r,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _start() async {
    int counter = 0;
    timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      _controller.animateToItem(
        counter,
        duration: const Duration(milliseconds: 150),
        curve: Curves.linear,
      );
      counter--;
    });

    await Future.delayed(const Duration(seconds: 2));
    final result = await _stop();
    _lastId = result;
    widget.onCompleted?.call(_list[result]);
  }

  Future<int> _stop() async {
    timer?.cancel();
    int rand = Random().nextInt(_list.length);

    while (rand == _lastId) {
      rand = Random().nextInt(_list.length);
    }

    _list[rand] = _generateResultList(item: widget.item);
    setState(() {});

    await _controller.animateToItem(
      rand,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.decelerate,
    );

    return rand;
  }

  List<RollingItem> _generateResultList({RollingItem? item}) {
    final subList = <RollingItem>[];
    int count = 0;

    if (widget.combination != null && widget.item != null) {
      final comb = SlotGameRepository.allCombinations[widget.combination!];

      for (int x = 0; x < comb.length; x++) {
        if (comb[x][widget.id] == 1) {
          count++;
          subList.add(widget.item!);
          continue;
        }

        final rand = Random().nextInt(widget.reelItemsList.length);
        final value = widget.reelItemsList[rand];
        count++;
        subList.add(value);
      }

      return subList;
    }

    while (true) {
      final rand = Random().nextInt(widget.reelItemsList.length);
      final value = widget.reelItemsList[rand];
      count++;
      subList.add(value);
      if (count == 5) break;
    }

    return subList;
  }
}
