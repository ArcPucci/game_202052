import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/service/configuration_service.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/logic/logic.dart';
import 'features/features.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();
    final configProvider = ConfigurationService(preferences);

    runApp(
      ScreenUtilInit(
        designSize: Size(390, 844),
        builder: (context, child) {
          return MyApp(configurationService: configProvider);
        },
      ),
    );
  }, (error, stack) {});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.configurationService});

  final ConfigurationService configurationService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    final path = widget.configurationService.getFirstInit();
    router = GoRouter(
      // initialLocation: path ? '/welcome' : '/loading',
      initialLocation: '/',
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
              path: 'main',
              builder: (context, state) => const MyGamePage(),
            ),
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
              routes: [
                GoRoute(
                  path: 'extra',
                  builder: (context, state) => const BombaGamePage(),
                ),
              ],
            ),
            GoRoute(
              path: 'thimbles',
              builder: (context, state) => const ThimblesPage(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: widget.configurationService),
        ChangeNotifierProvider(
          create: (_) => ConfigurationProvider(widget.configurationService),
        ),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }
}
