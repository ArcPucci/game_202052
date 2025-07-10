import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_202052/common/logic/logic.dart';

enum MainGameState { idle, playing, paused }

class GameManager extends Component {
  final ConfigurationProvider _configurationProvider;

  GameManager(this._configurationProvider);

  ValueNotifier<int> score = ValueNotifier(0);
  ValueNotifier<MainGameState> state = ValueNotifier(MainGameState.idle);

  int _health = 3;

  void init() {
    score.value = _configurationProvider.stars;
  }

  void pauseGame() {
    state.value = MainGameState.paused;
  }

  void resumeGame() {
    state.value = MainGameState.playing;
  }

  void addScore(int points) {
    if (points < 0) _health--;
    score.value += points;
    _configurationProvider.addStars(points);

    if (_health > 0) return;
    state.value = MainGameState.paused;
  }
}
