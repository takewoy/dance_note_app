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

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/0',
    routes: [
      GoRoute(
        path: '/:index',
        builder: (context, state) {
          final tabIndex = ref.read(tabIndexProvider);
          return Home(tabIndex: tabIndex);
        },
        routes: [
          GoRoute(
            path: SearchPage.routeName,
            name: SearchPage.routeName,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder: (_, animation, __, child) =>
                  FadeTransition(opacity: animation, child: child),
              child: const SearchPage(),
            ),
          ),
          GoRoute(
            path: SettingPage.routeName,
            name: SettingPage.routeName,
            pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: SettingPage(),
            ),
          ),
          GoRoute(
            path: '${EditForm.routeName}/:id',
            name: EditForm.routeName,
            pageBuilder: (context, state) {
              final id = state.params['id'];
              // Noteの新規作成
              if (id == 'add') {
                return MaterialPage(
                  fullscreenDialog: true,
                  child: ProviderScope(
                    overrides: [
                      editNoteProvider.overrideWithValue(null),
                    ],
                    child: const EditForm(),
                  ),
                );
              }
              // Noteの編集
              final notes = ref.watch(danceNoteProvider).value ?? [];
              final note = notes.where((e) => e.id.toString() == id);
              // もしNoteが見つからなかった場合はNotFoundPageへ
              if (note.isEmpty) {
                return const MaterialPage(
                  fullscreenDialog: true,
                  child: NotFoundPage(),
                );
              }
              return MaterialPage(
                fullscreenDialog: true,
                child: ProviderScope(
                  overrides: [
                    editNoteProvider.overrideWithValue(note.first),
                  ],
                  child: const EditForm(),
                ),
              );
            },
          ),
          GoRoute(
            path: NotFoundPage.routeName,
            name: NotFoundPage.routeName,
            pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: NotFoundPage(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
    urlPathStrategy: UrlPathStrategy.path,
  ),
);
