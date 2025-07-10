import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/service/service.dart';
import 'package:game_202052/core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

import '../view.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = PageController();
  int currentPage = 0;

  final titles = ["Welcome", "Games", "Customization"];
  final descriptions = [
    "We invite you to have fun with us in our mini games",
    "Here you will find mood and pleasure, you will like it!",
    "You can style the character however you like and to your taste",
  ];

  @override
  Widget build(BuildContext context) {
    final lastPage = titles.length - 1 == currentPage;
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/onboarding_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (index) => setState(() => currentPage = index),
              children: [WelcomePage1(), WelcomePage2(), WelcomePage3()],
            ),
          ),
          Positioned(
            bottom: 80.h,
            child: Container(
              width: 357.w,
              height: 259.h,
              decoration: BoxDecoration(
                gradient: MyTheme.redGradient1,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 37.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(titles[currentPage], style: MyTextStyles.ma32_700),
                      SizedBox(height: 5.h),
                      Text(
                        descriptions[currentPage],
                        style: MyTextStyles.ma16_400,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 53.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        return Container(
                          width: 11.r,
                          height: 11.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        );
                      }),
                    ),
                  ),
                  GestureDetector(
                    onTap: next,
                    child: Container(
                      width: 237.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: GradientBoxBorder(
                          gradient: MyTheme.redGradient1,
                          width: 2.sp,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(8, 8),
                            blurRadius: 10,
                            color: Colors.black.withValues(alpha: 0.25),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return MyTheme.redGradient1.createShader(bounds);
                        },
                        child: Text(
                          lastPage ? "Start" : "Next",
                          style: MyTextStyles.ma20_700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void next() {
    if (titles.length - 1 == currentPage) {
      context.read<ConfigurationService>().setFirstInit();
      context.go('/loading');
      return;
    }

    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
