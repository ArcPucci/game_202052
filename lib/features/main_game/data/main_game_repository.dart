import 'package:game_202052/features/features.dart';

class MainGameRepository {
  static final List<FallingObjectModel> fallingObjects = [
    FallingObjectModel(
      name: 'cards',
      asset: 'fallingItem1.png',
      isBomb: false,
      reward: 50,
    ),
    FallingObjectModel(
      name: 'clever',
      asset: 'fallingItem2.png',
      isBomb: false,
      reward: 100,
    ),
    FallingObjectModel(
      name: 'pika',
      asset: 'fallingItem3.png',
      isBomb: false,
      reward: 200,
    ),
    FallingObjectModel(
      name: 'heart',
      asset: 'fallingItem4.png',
      isBomb: false,
      reward: 250,
    ),
    FallingObjectModel(
      name: 'cube',
      asset: 'fallingItem5.png',
      isBomb: false,
      reward: 250,
    ),
    FallingObjectModel(
      name: 'Bomb',
      asset: 'fallingItem6.png',
      isBomb: true,
      reward: -200,
    ),
    FallingObjectModel(
      name: 'gold cube',
      asset: 'fallingItem7.png',
      isBomb: false,
      reward: 2500,
    ),
  ];
}
