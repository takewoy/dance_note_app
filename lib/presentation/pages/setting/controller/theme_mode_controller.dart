import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../repositories/prefs/prefs_service.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeController, ThemeMode>(
  (ref) => ThemeModeController(ref.read),
);

class ThemeModeController extends StateNotifier<ThemeMode> {
  ThemeModeController(this._read) : super(ThemeMode.system) {
    _init();
  }

  final Reader _read;
  late final _prefs = _read(prefsProvider);

  void _init() {
    final index = _prefs.getThemeIndex() ?? 0;
    final mode = ThemeMode.values.firstWhere((e) => e.index == index);
    state = mode;
  }

  void setTheme(ThemeMode mode) {
    state = mode;
    _prefs.saveThemeIndex(mode.index);
  }
}
