import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';

class FallingObjectComponent extends SpriteComponent with CollisionCallbacks {
  final MyGame game;
  final FallingObjectModel fallingObjectModel;
  final double posX;

  final Vector2 _size = Vector2(56.r, 65.r);
  double speed = 200;
  double _angle = 0;
  bool _falling = true;

  FallingObjectComponent({
    required this.game,
    required this.fallingObjectModel,
    required this.posX,
  });

  @override
  FutureOr<void> onLoad() async {
    size = _size;
    add(RectangleHitbox());
    position = Vector2(posX, -size.y);
    sprite = await Sprite.load(fallingObjectModel.asset);
    _angle = Random().nextDouble() * 2 - 1;
    anchor = Anchor.center;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (game.paused) return;
    if (position.y > game.size.y - 200.h) {
      _remove();
    }

    if (!_falling) return;

    position.y += speed * dt;
    angle += _angle * dt;
  }

  void _remove() {
    _falling = false;
    if (fallingObjectModel.isBomb) {
      if (opacity != 0) opacity = 0;
      final animation = FiniteMultiSizePulsingAnimation(
        itemAngle: angle,
        frameDuration: 0.1,
        imagePaths: ['fire1.png', 'fire2.png', 'fire3.png', 'fire4.png'],
        onCompleted: () {
          removeFromParent();
        },
      );
      add(animation);
      return;
    }

    removeFromParent();
    return;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is LeaderState) {
      if ((fallingObjectModel.isBomb && opacity == 1) ||
          !fallingObjectModel.isBomb) {
        game.gameManager.addScore(fallingObjectModel.reward);
      }
      _remove();
    }
  }
}

class FiniteMultiSizePulsingAnimation extends PositionComponent {
  final List<String> imagePaths;
  final double pulseScale;
  final double pulseSpeed;
  final double frameDuration;
  final VoidCallback? onCompleted;
  final double itemAngle;

  late List<SpriteComponent> _components;
  int _currentIndex = 0;
  double _elapsedTime = 0;
  double _currentScale = 1.0;
  bool _isScalingUp = true;
  bool _completed = false;
  Vector2 _baseSize = Vector2.zero();

  FiniteMultiSizePulsingAnimation({
    required this.imagePaths,
    this.pulseScale = 1.1,
    this.pulseSpeed = 1.0,
    this.frameDuration = 0.5,
    this.onCompleted,
    Vector2? position,
    required this.itemAngle,
  }) {
    this.position = position ?? Vector2.zero();
    anchor = Anchor.centerLeft;
  }

  @override
  Future<void> onLoad() async {
    angle = -itemAngle;
    _components = await Future.wait(
      imagePaths.map((path) async {
        final sprite = await Sprite.load(path);
        final component = SpriteComponent(
          sprite: sprite,
          size: sprite.originalSize,
        );
        component.anchor = Anchor.center;
        return component;
      }),
    );

    _baseSize = _components.first.size;
    size = _baseSize;
    add(_components.first);
  }

  @override
  void update(double dt) {
    if (_completed) return;

    _elapsedTime += dt;

    // Пульсация текущего кадра
    if (_isScalingUp) {
      _currentScale += pulseSpeed * dt;
      if (_currentScale >= pulseScale) _isScalingUp = false;
    } else {
      _currentScale -= pulseSpeed * dt;
      if (_currentScale <= 1.0) _isScalingUp = true;
    }

    _components[_currentIndex].scale = Vector2.all(_currentScale);

    // Переключение кадров
    if (_elapsedTime >= frameDuration) {
      _elapsedTime = 0;
      _switchToNextFrame();
    }

    super.update(dt);
  }

  void _switchToNextFrame() {
    _components[_currentIndex].removeFromParent();
    _currentIndex++;

    if (_currentIndex >= _components.length) {
      _onAnimationComplete();
      return;
    }

    _baseSize = _components[_currentIndex].size;
    size = _baseSize;
    _currentScale = 1.0;
    _isScalingUp = true;
    add(_components[_currentIndex]);
  }

  void _onAnimationComplete() {
    _completed = true;
    onCompleted?.call();
    removeFromParent();
  }
}
