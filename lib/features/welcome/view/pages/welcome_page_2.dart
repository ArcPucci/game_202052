import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({super.key});

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 1.0,
      upperBound: 1.1,
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 1.0,
      upperBound: 1.1,
    );

    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 1.0,
      upperBound: 1.1,
    );

    init();
  }

  void init() async {
    await _controller1.forward();
    await _controller1.reverse();
    await _controller2.forward();
    await _controller2.reverse();
    await _controller3.forward();
    await _controller3.reverse();
    init();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      height: 844.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 64.h,
            child: Image.asset(
              'assets/png/phone_bg_2.png',
              width: 289.r,
              height: 580.r,
            ),
          ),
          Positioned(
            top: 112.h,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _controller1,
                  builder: (BuildContext context, Widget? child) {
                    return SizedBox(
                      width: 331.r,
                      height: 183.r,
                      child: Transform.scale(
                        scale: _controller1.value,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.scale(
                              scale: 2.5,
                              child: Opacity(
                                opacity:
                                    (_controller1.value -
                                        _controller1.lowerBound) /
                                    0.105,
                                child: Image.asset(
                                  'assets/png/blur1.png',
                                  width: 385.r,
                                  height: 213.r,
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/png/banner1.png',
                              width: 331.r,
                              height: 183.r,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _controller2,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.scale(
                          scale: _controller2.value,
                          child: SizedBox(
                            width: 157.r,
                            height: 156.r,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.scale(
                                  scale: 2.5,
                                  child: Opacity(
                                    opacity:
                                        (_controller2.value -
                                            _controller2.lowerBound) /
                                        0.105,
                                    child: Image.asset(
                                      'assets/png/blur2.png',
                                      width: 184.r,
                                      height: 181.r,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/png/banner2.png',
                                  width: 157.r,
                                  height: 156.r,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 5.r),
                    AnimatedBuilder(
                      animation: _controller3,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.scale(
                          scale: _controller3.value,
                          child: SizedBox(
                            width: 157.r,
                            height: 156.r,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.scale(
                                  scale: 2.5,
                                  child: Opacity(
                                    opacity:
                                        (_controller3.value -
                                            _controller3.lowerBound) /
                                        0.105,
                                    child: Image.asset(
                                      'assets/png/blur2.png',
                                      width: 184.r,
                                      height: 181.r,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/png/banner3.png',
                                  width: 157.r,
                                  height: 156.r,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
