import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'features/features.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      ScreenUtilInit(
        designSize: Size(390, 844),
        builder: (context, child) {
          return const MyApp();
        },
      ),
    );
  }, (error, stack) {});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = GoRouter(
    initialLocation: '/slot',
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/loading',
        builder: (context, state) => const LoadingPage(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const MainPage(),
        routes: [
          GoRoute(
            path: 'skins',
            builder: (context, state) => const SkinsPage(),
            routes: [
              GoRoute(
                path: 'coins',
                builder: (context, state) => const CoinsPage(),
              ),
            ],
          ),
          GoRoute(
            path: 'skills',
            builder: (context, state) => const SkillsPage(),
            routes: [
              GoRoute(
                path: 'coins',
                builder: (context, state) => const CoinsPage(),
              ),
            ],
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: 'coins',
            builder: (context, state) => const CoinsPage(),
          ),
          GoRoute(
            path: 'slot',
            builder: (context, state) => const SlotGamePage(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

/*
* lib/
├── main.dart
├── core/            # Общие вещи: темы, утилиты, ошибки
│   ├── theme/
│   └── utils/
├── features/        # Разделение по функциональности
│   └── auth/        # Пример: авторизация
│       ├── data/
│       │   └── auth_service.dart
│       ├── model/
│       │   └── user_model.dart
│       ├── view/
│       │   └── login_page.dart
│       ├── logic/
│       │   └── auth_controller.dart  # например, Riverpod controller
│       └── widget/
│           └── login_form.dart*/
