import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class LeaderState extends SpriteComponent {
  final Vector2 itemSize;
  final String spritePath;
  final ShapeHitbox? hitbox;

  LeaderState({
    required this.itemSize,
    required this.spritePath,
    ShapeHitbox Function()? hitboxCreator,
  }) : hitbox = hitboxCreator?.call();

  @override
  FutureOr<void> onLoad() async {
    size = itemSize;
    sprite = await Sprite.load(spritePath);

    if (hitbox != null) {
      add(hitbox!);
    }
    return super.onLoad();
  }
}
