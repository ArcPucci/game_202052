class BombModel {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final bool isLeft;
  final bool hasGold;
  final int angle;

  BombModel({
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.isLeft = true,
    this.hasGold = false,
    this.angle = 0,
  });
}
