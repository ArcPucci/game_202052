import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'my_game.dart';
import 'overlays/overlays.dart';

class MyGamePage extends StatefulWidget {
  const MyGamePage({super.key});

  @override
  State<MyGamePage> createState() => _MyGamePageState();
}

class _MyGamePageState extends State<MyGamePage> {
  late final MyGame game = MyGame(Provider.of(context, listen: false));

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: GameWidget<MyGame>(
                game: game,
                overlayBuilderMap: {
                  "appBarOverlay":
                      (context, game) => CustomAppBarOverlay(game),
                  "gameControllerOverlay":
                      (context, game) => GameControllerOverlay(game),
                  "informationOverlay":
                      (context, game) => InformationOverlay(game),
                  "skillsOverlay": (context, game) => SkillsOverlay(game),
                  "gameOverOverlay": (context, game) => GameOverOverlay(game),
                  "leaveConfirmationOverlay":
                      (context, game) => LeaveConfirmationOverlay(game),
                  "introOverlay":
                      (context, game) => IntroOverlay(game),
                },
                backgroundBuilder: (context) {
                  return Image.asset(
                    'assets/png/main_game_bg.png',
                    width: 390.w,
                    height: 844.h,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
