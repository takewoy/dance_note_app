// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefsProvider = Provider<PrefsService>(
  (_) => throw UnimplementedError(),
);

class PrefsService {
  const PrefsService(this._prefs);
  final SharedPreferences _prefs;

  /// Theme mode
  static const themeIndex = 'prefsThemeIndex';
  int? getThemeIndex() => _prefs.getInt(themeIndex);
  Future<bool> saveThemeIndex(int index) async =>
      _prefs.setInt(themeIndex, index);

  /// Dance categories ---------------------------------------------------------
  static const waltz = 'prefsVisibleWaltz';
  static const tango = 'prefsVisibleTango';
  static const visibleViennese = 'prefsVisibleViennese';
  static const slowFoxtrot = 'prefsVisibleSlowFoxtrot';
  static const quickStep = 'prefsVisibleQuickStep';
  static const samba = 'prefsVisibleSamba';
  static const chaChaCha = 'prefsVisibleChaChaCha';
  static const rumba = 'prefsVisibleRumba';
  static const pasoDoble = 'prefsVisiblePasoDoble';
  static const jive = 'prefsVisibleJive';

  /// Category
  bool? getVisibleDance(String key) => _prefs.getBool(key);
  Future<bool> saveVisibleDance(String key, bool value) async =>
      _prefs.setBool(key, value);
}
