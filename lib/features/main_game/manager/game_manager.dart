import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_202052/common/logic/logic.dart';

import '../my_game.dart';

enum MainGameState { idle, playing, paused }

class GameManager extends Component {
  final ConfigurationProvider _configurationProvider;
  final MyGame game;

  GameManager(this._configurationProvider, this.game);

  int get skinID => _configurationProvider.state;

  ValueNotifier<int> score = ValueNotifier(0);
  ValueNotifier<MainGameState> state = ValueNotifier(MainGameState.idle);

  static const int _initHealth = 1;
  int _health = _initHealth;

  ValueNotifier<int> time = ValueNotifier(3);
  ValueNotifier<int> skillTimer = ValueNotifier(0);

  ValueNotifier<int> skillId = ValueNotifier(-1);

  late TimerComponent timerComponent;

  void init() {
    score.value = 0;
    state.value = MainGameState.paused;
    time.value = 3;
    _health = _initHealth;

    timerComponent = TimerComponent(
      period: 1,
      repeat: true,
      onTick: () {
        if (time.value <= 0) {
          timerComponent.removeFromParent();
          state.value = MainGameState.playing;
          game.startGame();
          return;
        }
        time.value--;
      },
    );
    add(timerComponent);
  }

  void useSkill(int id) {
    if (id == 0 && _configurationProvider.reflexes == 0) return;
    if (id == 1 && _configurationProvider.extendedReach == 0) return;
    if (id == 2 && _configurationProvider.speedBoost == 0) return;

    skillTimer.value = 30;
    if (children.contains(timerComponent)) timerComponent.removeFromParent();
    timerComponent = TimerComponent(
      period: 1,
      repeat: true,
      onTick: () {
        if (state.value == MainGameState.paused) return;
        if (skillTimer.value <= 0) {
          skillId.value = -1;
          timerComponent.removeFromParent();
          return;
        }

        skillTimer.value--;
      },
    );

    skillId.value = id;
    add(timerComponent);

    _configurationProvider.useSkill(id);
  }

  void pauseGame() {
    state.value = MainGameState.paused;
  }

  void gameOver() {
    state.value = MainGameState.paused;
    if (skillTimer.value >= 0 && children.contains(timerComponent)) {
      skillTimer.value = 0;
      timerComponent.removeFromParent();
    }
  }

  void resumeGame() {
    state.value = MainGameState.playing;
  }

  void addScore(int points) {
    if (points < 0) _health--;
    score.value += points;

    if (_health > 0) return;

    _configurationProvider.addStars(score.value);
    state.value = MainGameState.paused;
    game.gameOver();
  }
}
