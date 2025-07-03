import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Game3Button extends StatelessWidget {
  const Game3Button({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163.r,
      height: 110.r,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/game3.png', fit: BoxFit.fill),
          ),
          Transform.scale(
            scale: 1.2,
            child: Image.asset(
              'assets/png/ellipse5.png',
              width: 157.r,
              height: 51.r,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Transform.scale(
                scale: 2,
                child: Image.asset(
                  'assets/png/ellipse6.png',
                  width: 92.r,
                  height: 87.r,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
