import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/form/controller/edit_form_controller.dart';
import '../pages/form/edit_form.dart';
import '../pages/home/controller/home_controller.dart';
import '../pages/home/home.dart';
import '../pages/not_found/not_found_page.dart';
import '../pages/search/search_page.dart';
import '../pages/setting/setting.dart';

part 'router.g.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    errorBuilder: (context, state) => const NotFoundPage(),
    routes: $appRoutes,
  ),
);

@TypedGoRoute<HomePageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SearchPageRoute>(path: 'search'),
    TypedGoRoute<SettingPageRoute>(path: 'setting'),
    TypedGoRoute<EditFormRoute>(path: 'edit-form/:id'),
    TypedGoRoute<NotFoundPageRoute>(path: 'not-found'),
  ],
)
class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  Widget build(BuildContext context) => const HomePage();
}

class SearchPageRoute extends GoRouteData {
  const SearchPageRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
      child: const SearchPage(),
    );
  }
}

class SettingPageRoute extends GoRouteData {
  const SettingPageRoute();

  @override
  MaterialPage<void> buildPage(BuildContext context) {
    return const MaterialPage(
      fullscreenDialog: true,
      child: SettingPage(),
    );
  }
}

class EditFormRoute extends GoRouteData {
  const EditFormRoute({required this.id});

  final String id;
  @override
  MaterialPage<void> buildPage(BuildContext context) {
    return MaterialPage(
      fullscreenDialog: true,
      child: Consumer(
        builder: (context, ref, child) {
          if (id == 'add') {
            return ProviderScope(
              overrides: [
                editNoteProvider.overrideWithValue(null),
              ],
              child: const EditForm(),
            );
          }
          // Noteの編集の場合
          final notes = ref.read(danceNoteProvider).value ?? [];
          final note = notes.where((e) => e.id.toString() == id);
          // もしNoteが見つからなかった場合はNotFoundPageへ
          if (note.isEmpty) {
            return const NotFoundPage();
          }
          return ProviderScope(
            overrides: [
              editNoteProvider.overrideWithValue(note.first),
            ],
            child: const EditForm(),
          );
        },
      ),
    );
  }
}

class NotFoundPageRoute extends GoRouteData {
  const NotFoundPageRoute();

  @override
  Widget build(BuildContext context) => const NotFoundPage();
}
