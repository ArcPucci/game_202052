import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/features/features.dart';

class SkinsRepository {
  static final List<Skin> _skins = [
    Skin(id: 0, price: 0, asset: 'assets/png/idle.png'),
    Skin(id: 1, price: 1000, asset: 'assets/png/sun_glasses.png'),
    Skin(id: 2, price: 1000, asset: 'assets/png/chain.png'),
    Skin(id: 3, price: 1000, asset: 'assets/png/watch.png'),
  ];

  static final List<SkinModel> skinModels = [
    SkinModel(
      top: 42.h,
      width: 129.r,
      height: 168.r,
      left: 5.r,
      skin: _skins[0],
    ),
    SkinModel(top: 62.h, width: 125.r, height: 83.r, left: 0, skin: _skins[1]),
    SkinModel(top: 71.h, width: 86.r, height: 82.r, left: 0, skin: _skins[2]),
    SkinModel(top: 71.h, width: 67.r, height: 82.r, left: 0, skin: _skins[3]),
  ];
}
