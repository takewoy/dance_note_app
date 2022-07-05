import 'package:flutter/material.dart';

extension ThemeModeX on ThemeMode {
  String get label {
    switch (this) {
      case ThemeMode.system:
        return '端末の設定に従う';
      case ThemeMode.light:
        return 'ライトテーマ';
      case ThemeMode.dark:
        return 'ダークテーマ';
    }
  }
}
