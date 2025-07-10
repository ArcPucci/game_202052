import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/data.dart';
import '../main_game.dart';

class FallingObjectsManager extends Component {
  final MyGame game;

  FallingObjectsManager({
    super.children,
    super.priority,
    super.key,
    required this.game,
  });

  @override
  void update(double dt) async {
    super.update(dt);
    final fallingObjects =
        game.children.whereType<FallingObjectComponent>().toList();

    if (fallingObjects.isNotEmpty) return;
    final item = _getRandObject();
    game.add(item);
  }

  FallingObjectComponent _getRandObject() {
    final rand1 = Random().nextBool();
    final rand = Random().nextInt(MainGameRepository.fallingObjects.length);
    final object = FallingObjectComponent(
      game: game,
      fallingObjectModel: MainGameRepository.fallingObjects[rand],
      posX: rand1 ? 100.w : 300.w,
    );

    return object;
  }
}
