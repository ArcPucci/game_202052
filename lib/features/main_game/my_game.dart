import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/logic/logic.dart';

import '../features.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  late final FallingObjectsManager fallingObjectsManager;
  late final GameManager gameManager;
  late final LeaderComponent leaderComponent;
  final ConfigurationProvider _configurationProvider;

  MyGame(this._configurationProvider);

  @override
  FutureOr<void> onLoad() async {
    fallingObjectsManager = FallingObjectsManager(game: this);
    gameManager = GameManager(_configurationProvider, this);
    add(gameManager);

    leaderComponent = LeaderComponent(this);

    overlays.add('gameControllerOverlay');
    overlays.add('appBarOverlay');
    final ellipse = SpriteComponent(
      priority: -1,
      sprite: await Sprite.load('ellipse1.png'),
      size: Vector2(400.r, 400.r),
      position: Vector2((size.x - 400.r) / 2, 150.h),
    );

    add(ellipse);

    init();

    return await super.onLoad();
  }

  void init() {
    overlays.add('introOverlay');
    gameManager.init();
  }

  void startGame() async {
    overlays.remove('introOverlay');

    add(leaderComponent);
    add(fallingObjectsManager);
  }

  void gameOver() {
    gameManager.pauseGame();
    fallingObjectsManager.removeFromParent();
    leaderComponent.removeFromParent();

    overlays.add('gameOverOverlay');
  }

  void retry() {
    overlays.remove('gameOverOverlay');
    init();
  }

  void cancelLeave() {
    overlays.remove('leaveConfirmationOverlay');
    gameManager.resumeGame();
  }

  void showConfirmation() {
    if(gameManager.state.value == MainGameState.paused) return;
    gameManager.pauseGame();
    overlays.add('leaveConfirmationOverlay');
  }

  void onHoldLeftUp() {
    if(gameManager.state.value == MainGameState.paused) return;
    leaderComponent.onHoldLeftUp();
  }

  void onHoldLeftDown() {
    if(gameManager.state.value == MainGameState.paused) return;
    leaderComponent.onHoldLeftDown();
  }

  void onHoldRightUp() {
    if(gameManager.state.value == MainGameState.paused) return;
    leaderComponent.onHoldRightUp();
  }

  void onHoldRightDown() {
    if(gameManager.state.value == MainGameState.paused) return;
    leaderComponent.onHoldRightDown();
  }

  void onCancel() {
    if(gameManager.state.value == MainGameState.paused) return;
    leaderComponent.onCancel();
  }

  void openInformation() {
    if(gameManager.state.value == MainGameState.paused) return;
    gameManager.pauseGame();
    overlays.add('informationOverlay');
  }

  void useSkill(int id) {
    closeSkills();
    gameManager.useSkill(id);
  }

  void closeInformation() {
    overlays.remove('informationOverlay');
    gameManager.resumeGame();
  }

  void openSkills() {
    if(gameManager.state.value == MainGameState.paused) return;
    gameManager.pauseGame();
    overlays.add('skillsOverlay');
  }

  void closeSkills() {
    overlays.remove('skillsOverlay');
    gameManager.resumeGame();
  }
}
