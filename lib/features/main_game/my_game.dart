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
    leaderComponent = LeaderComponent(this);
    gameManager = GameManager(_configurationProvider);

    final ellipse = SpriteComponent(
      priority: -1,
      sprite: await Sprite.load('ellipse1.png'),
      size: Vector2(400.r, 400.r),
      position: Vector2((size.x - 400.r) / 2, 150.h),
    );

    add(ellipse);
    add(leaderComponent);
    add(fallingObjectsManager);
    add(gameManager);
    overlays.add('gameControllerOverlay');
    overlays.add('appBarOverlay');

    return await super.onLoad();
  }

  void onHoldLeftUp() {
    leaderComponent.onHoldLeftUp();
  }

  void onHoldLeftDown() {
    leaderComponent.onHoldLeftDown();
  }

  void onHoldRightUp() {
    leaderComponent.onHoldRightUp();
  }

  void onHoldRightDown() {
    leaderComponent.onHoldRightDown();
  }

  void onCancel() {
    leaderComponent.onCancel();
  }

  void openInformation() {
    overlays.add('informationOverlay');
  }

  void closeInformation() {
    overlays.remove('informationOverlay');
  }

  void openSkills() {
    overlays.add('skillsOverlay');
  }

  void closeSkills() {
    overlays.remove('skillsOverlay');
  }
}
