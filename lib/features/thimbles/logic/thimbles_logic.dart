import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features.dart';

enum ThimblesState { idle, finished, animating, started }

class ThimblesController extends ChangeNotifier {
  ThimblesController() {
    initGame();
  }

  ThimblesState _state = ThimblesState.idle;

  bool get started => _state != ThimblesState.idle;

  bool get canBet => _state == ThimblesState.started;

  bool get isFinished => _state == ThimblesState.finished;

  bool get animating => _state == ThimblesState.animating;

  int _streak = 0;

  int get streak => _streak;

  static const _betStep = 50;

  bool _selectedCup = true;

  List<bool> get canIncrease => [true, true, true, true];

  int get betsSum => _bets.reduce((value, element) => value + element);

  List<bool> get canDecrease => [
    _bets[0] > 0,
    _bets[1] > 0,
    _bets[2] > 0,
    _bets[3] > 0,
  ];

  static final _cupsList = [
    CupModel(id: 0, top: 0, left: 0),
    CupModel(id: 1, top: 0, left: 170.r),
    CupModel(id: 2, top: 146.r, left: 0),
    CupModel(id: 3, top: 146.r, left: 170.r),
  ];

  final List<CupModel> _cups = List.from(_cupsList);

  List<CupModel> get cups => _cups;

  final List<int> _bets = [0, 0, 0, 0];

  List<int> get bets => _bets;

  void initGame() {
    _cups.clear();
    _cups.addAll(_cupsList);
    _state = ThimblesState.idle;
    _streak = 0;
    _bets.clear();
    _bets.addAll([0, 0, 0, 0]);

    notifyListeners();
  }

  void start() async {
    _state = ThimblesState.started;
    final rand = Random().nextInt(_cups.length);
    _cups[rand].hasDice = true;
    notifyListeners();
  }

  void initCups(int index, controller) {
    _cups[index].controller = controller;
  }

  void nextRound() async {
    if (betsSum == 0) return;
    if (!_selectedCup) return;
    _state = ThimblesState.started;
    notifyListeners();

    await _showDice();
    _rotate();
  }

  Future<void> _showDice() async {
    if (_state == ThimblesState.animating) return;
    _state = ThimblesState.animating;
    notifyListeners();
    final rand = _cups.indexWhere((element) => element.hasDice);
    await _cups[rand].controller?.forward();
    await Future.delayed(Duration(seconds: 1));
    await _cups[rand].controller?.reverse();
    _state = ThimblesState.started;
    notifyListeners();
  }

  void openCup(int index) async {
    if (animating) return;
    if (_selectedCup) return;
    _selectedCup = true;
    _state = ThimblesState.animating;
    notifyListeners();
    await _cups[index].controller?.forward();
    await Future.delayed(Duration(seconds: 1));

    if (_cups[index].hasDice) {
      _streak++;
      // print(_bets[_cups[index].id]);
      if (_streak == 5) {
        _state = ThimblesState.finished;
        notifyListeners();
        return;
      }
    } else {
      _streak = 0;
    }

    for (int i = 0; i < _bets.length; i++) {
      _bets[i] = 0;
    }

    _state = ThimblesState.started;
    await _cups[index].controller?.reverse();
    notifyListeners();
  }

  void _rotate() async {
    _state = ThimblesState.animating;
    notifyListeners();

    final length = Random().nextInt(4) + 4;
    int count = 0;
    while (count < length) {
      await _swap();
      count++;
    }

    _state = ThimblesState.started;
    _selectedCup = false;
    notifyListeners();
  }

  Future<void> _swap() async {
    final list = [0, 1, 2, 3];
    list.shuffle();
    final cup1 = list[0];
    list.removeAt(0);
    list.shuffle();
    final cup2 = list[0];
    _cups[cup1].swapPosition(_cups[cup2]);
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 800));
  }

  void increaseBet(int index) {
    _bets[index] += _betStep;
    notifyListeners();
  }

  void decreaseBet(int index) {
    if (_bets[index] == 0) return;
    _bets[index] -= _betStep;
    notifyListeners();
  }
}
