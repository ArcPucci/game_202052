import 'dart:math';

import '../../features.dart';

class SlotGameRepository {
  static final List<RollingItem> slotItems = [
    RollingItem(index: 0, asset: 'assets/png/slot/item1.png'),
    RollingItem(index: 1, asset: 'assets/png/slot/item2.png'),
    RollingItem(index: 2, asset: 'assets/png/slot/item3.png'),
    RollingItem(index: 3, asset: 'assets/png/slot/item4.png'),
    RollingItem(index: 4, asset: 'assets/png/slot/item5.png'),
    RollingItem(index: 5, asset: 'assets/png/slot/item6.png'),
    RollingItem(index: 6, asset: 'assets/png/slot/item7.png'),
    RollingItem(index: 7, asset: 'assets/png/slot/item8.png'),
  ];

  static const allCombinations = [...extraGameCombinations, ...winCombinations];

  static const List<List<List<int>>> extraGameCombinations = [
    [
      [1, 0, 0, 0],
      [0, 1, 0, 1],
      [0, 0, 1, 0],
      [0, 1, 0, 1],
      [1, 0, 0, 0],
    ],
    [
      [0, 0, 0, 1],
      [1, 0, 1, 0],
      [0, 1, 0, 0],
      [1, 0, 1, 0],
      [0, 0, 0, 1],
    ],
  ];

  static const List<List<List<int>>> winCombinations = [
    [
      [1, 0, 0, 1],
      [1, 1, 1, 1],
      [1, 0, 0, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ],
    [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 1],
      [1, 1, 1, 1],
      [1, 0, 0, 1],
    ],
    [
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 1, 0],
      [0, 1, 0, 0],
      [1, 0, 0, 0],
    ],
    [
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 1],
    ],
  ];
}
