import 'package:flutter/material.dart';

class SlotGameController extends ChangeNotifier {
  VoidCallback? _launchMachine;

  SlotGameController(this.showExtraGame, this.showWin);

  final VoidCallback? showExtraGame;
  final void Function(int win) showWin;

  static const _step = 100;

  int _lastWin = 0;

  int get lastWin => _lastWin;

  int _currentBet = _step;

  int get currentBet => _currentBet;

  bool get canIncreaseBet => _currentBet < 10000 && !_isSpinning;

  bool get canDecreaseBet => _currentBet > _step && !_isSpinning;

  bool _isSpinning = false;

  void initMachine(VoidCallback? value) {
    _launchMachine = value;
  }

  void spin() {
    _launchMachine?.call();
    _isSpinning = true;
  }

  void checkResult(int? comb) async {
    if (comb != null) {
      await Future.delayed(Duration(seconds: 1));
      showWin.call(_currentBet * 100);
      _lastWin = _currentBet * 100;
    }
    _isSpinning = false;
    notifyListeners();
  }

  void increaseCurrentBet() {
    if (!canIncreaseBet) return;
    _currentBet += _step;
    notifyListeners();
  }

  void decreaseCurrentBet() {
    if (!canDecreaseBet) return;
    _currentBet -= _step;
    notifyListeners();
  }
}
