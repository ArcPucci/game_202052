import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/models.dart';

class WelcomePage3 extends StatefulWidget {
  const WelcomePage3({super.key});

  @override
  State<WelcomePage3> createState() => _WelcomePage3State();
}

class _WelcomePage3State extends State<WelcomePage3> {
  final List<PersonState> persons = [
    PersonState(id: 0, asset: 'assets/png/state1.png', top: 0, left: 62.r),
    PersonState(id: 1, asset: 'assets/png/state2.png', top: 0, left: 161.r),
    PersonState(id: 2, asset: 'assets/png/state3.png', top: 0, left: 0),
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), moveNext);
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
              'assets/png/phone_bg_1.png',
              width: 289.r,
              height: 580.r,
            ),
          ),
          Positioned(
            top: 146.h,
            child: SizedBox(
              width: 268.r,
              height: 220.r,
              child: Stack(
                children: List.generate(persons.length, (index) {
                  final person = persons[index];
                  final active = _index == person.id;
                  final width = active ? 144.r : 107.r;
                  final height = active ? 220.r : 163.r;
                  return AnimatedPositioned(
                    top: person.top,
                    left: person.left,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: width,
                      height: height,
                      child: AnimatedOpacity(
                        opacity: active ? 1 : 0.5,
                        duration: Duration(milliseconds: 300),
                        child: Image.asset(person.asset, fit: BoxFit.fill),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            top: 354.h,
            width: 212.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AnimatedContainer(
                  width: _index == 2 ? 104.r : 100.r,
                  height: _index == 2 ? 138.r : 132.r,
                  duration: Duration(milliseconds: 300),
                  child: Image.asset(
                    'assets/png/banner4.png',
                    fit: BoxFit.fill,
                  ),
                ),
                AnimatedContainer(
                  width: _index == 1 ? 104.r : 100.r,
                  height: _index == 1 ? 138.r : 132.r,
                  duration: Duration(milliseconds: 300),
                  child: Image.asset(
                    'assets/png/banner5.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void moveNext() async {
    final firstLeft = persons.first.left;
    final firstTop = persons.first.top;

    persons[0].left = persons[2].left;
    persons[0].top = persons[2].top;

    persons[2].left = persons[1].left;
    persons[2].top = persons[1].top;

    persons[1].left = firstLeft;
    persons[1].top = firstTop;

    _index++;
    _index %= 3;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));
    moveNext();
  }
}
