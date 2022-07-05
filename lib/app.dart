import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/pages/setting/controller/theme_mode_controller.dart';
import 'presentation/router/router.dart';
import 'utils/util.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    const transition = PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    );
    return MaterialApp.router(
      scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
      scrollBehavior: const _AlwaysHaveScrollBarBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Dance Note App',
      themeMode: ref.watch(themeModeProvider),
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepPurple,
        appBarStyle: FlexAppBarStyle.material,
        appBarOpacity: 0.90,
        lightIsWhite: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          inputDecoratorRadius: 12,
          elevatedButtonRadius: 12,
          outlinedButtonRadius: 12,
          textButtonRadius: 12,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          keepPrimary: true,
          keepSecondary: true,
          keepTertiary: true,
          keepPrimaryContainer: true,
          keepSecondaryContainer: true,
          keepTertiaryContainer: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      ).copyWith(
        splashFactory: InkSparkle.splashFactory,
        pageTransitionsTheme: transition,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepPurple,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          inputDecoratorRadius: 12,
          elevatedButtonRadius: 12,
          outlinedButtonRadius: 12,
          textButtonRadius: 12,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          keepPrimary: true,
          keepSecondary: true,
          keepTertiary: true,
          keepPrimaryContainer: true,
          keepSecondaryContainer: true,
          keepTertiaryContainer: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      ).copyWith(
        splashFactory: InkSparkle.splashFactory,
        pageTransitionsTheme: transition,
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

/// [ListView]などでスクロールバーを表示するため
class _AlwaysHaveScrollBarBehavior extends MaterialScrollBehavior {
  const _AlwaysHaveScrollBarBehavior();
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    switch (axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        return Scrollbar(
          controller: details.controller,
          child: child,
        );
    }
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const AlwaysScrollableScrollPhysics(
      parent: BouncingScrollPhysics(),
    );
  }
}
