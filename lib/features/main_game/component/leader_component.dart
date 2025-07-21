import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';

enum LeaderStateType {
  idle(spritePath: 'man.png'),
  leftUp(spritePath: 'man_left_up.png', hitBoxFactory: _createLeftUpHitBox),
  leftDown(
    spritePath: 'man_left_down.png',
    hitBoxFactory: _createLeftDownHitBox,
  ),
  rightUp(spritePath: 'man_right_up.png', hitBoxFactory: _createRightUpHitBox),
  rightDown(
    spritePath: 'man_right_down.png',
    hitBoxFactory: _createBottomDownHitBox,
  );

  final String spritePath;
  final ShapeHitbox Function()? hitBoxFactory;

  const LeaderStateType({required this.spritePath, this.hitBoxFactory});

  static ShapeHitbox _createLeftUpHitBox() =>
      RectangleHitbox(size: Vector2(75.r, 45.r), position: Vector2(25.r, 45.r));

  static ShapeHitbox _createRightUpHitBox() => RectangleHitbox(
    size: Vector2(75.r, 45.r),
    position: Vector2(185.r, 45.r),
  );

  static ShapeHitbox _createLeftDownHitBox() => RectangleHitbox(
    size: Vector2(75.r, 50.r),
    position: Vector2(25.r, 150.r),
  );

  static ShapeHitbox _createBottomDownHitBox() => RectangleHitbox(
    size: Vector2(75.r, 50.r),
    position: Vector2(180.r, 150.r),
  );
}

class LeaderComponent extends PositionComponent {
  final MyGame game;
  final Vector2 _size = Vector2(282.r, 430.r);
  late final Map<LeaderStateType, LeaderState> _states;
  LeaderStateType _currentState = LeaderStateType.idle;

  LeaderComponent(this.game);

  @override
  FutureOr<void> onLoad() async {
    size = _size;

    final skin = getSkin(game.gameManager.skinID);

    _states = {
      for (var state in LeaderStateType.values)
        state: LeaderState(
          itemSize: _size,
          spritePath:
              skin.isNotEmpty
                  ? (state.spritePath.replaceFirst('.png', skin))
                  : state.spritePath,
          hitboxCreator: state.hitBoxFactory,
        )..priority = 1,
    };
    add(_states[_currentState]!);
    print(_states[_currentState]!.spritePath);

    final left = (game.size.x - size.x) / 2;
    final top = (game.size.y - size.y) / 2 + 50.h;
    position = Vector2(left, top);
  }

  void _changeState(LeaderStateType newState) {
    if (_currentState == newState) return;

    remove(_states[_currentState]!);
    _currentState = newState;
    add(_states[_currentState]!);
  }

  void onHoldLeftUp() => _changeState(LeaderStateType.leftUp);

  void onHoldLeftDown() => _changeState(LeaderStateType.leftDown);

  void onHoldRightUp() => _changeState(LeaderStateType.rightUp);

  void onHoldRightDown() => _changeState(LeaderStateType.rightDown);

  void onCancel() => _changeState(LeaderStateType.idle);

  String getSkin(int id) {
    return switch (id) {
      0 => '',
      1 => '_glass.png',
      2 => '_chain.png',
      3 => '_watch.png',
      _ => '',
    };
  }
}
