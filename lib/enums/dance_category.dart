import '../repositories/prefs/prefs_service.dart';

/// ダンス10種目
/// `prefsKey`はSharedPreferencesに保存するためのkey
/// [PrefsService]クラスで保存と取得を実行
enum DanceCategory {
  waltz(
    label: 'Waltz',
    initial: 'W',
    prefsKey: PrefsService.waltz,
  ),
  tango(
    label: 'Tango',
    initial: 'T',
    prefsKey: PrefsService.tango,
  ),
  vienneseWaltz(
    label: 'Viennese Waltz',
    initial: 'V',
    prefsKey: PrefsService.visibleViennese,
  ),
  slowFoxtrot(
    label: 'Slow Foxtrot',
    initial: 'F',
    prefsKey: PrefsService.slowFoxtrot,
  ),
  quickStep(
    label: 'Quick Step',
    initial: 'Q',
    prefsKey: PrefsService.quickStep,
  ),
  samba(
    label: 'Samba',
    initial: 'S',
    prefsKey: PrefsService.samba,
  ),
  chaChaCha(
    label: 'ChaChaCha',
    initial: 'C',
    prefsKey: PrefsService.chaChaCha,
  ),
  rumba(
    label: 'Rumba',
    initial: 'R',
    prefsKey: PrefsService.rumba,
  ),
  pasoDoble(
    label: 'Paso doble',
    initial: 'P',
    prefsKey: PrefsService.pasoDoble,
  ),
  jive(
    label: 'Jive',
    initial: 'J',
    prefsKey: PrefsService.jive,
  );

  const DanceCategory({
    required this.label,
    required this.initial,
    required this.prefsKey,
  });
  final String label;
  final String initial;
  final String prefsKey;
}

/// 使うか分かんないけど種目がスタンダードかラテンかを判定する用
extension DanceCategoryX on DanceCategory {
  bool get isStandard {
    if (this == DanceCategory.waltz ||
        this == DanceCategory.tango ||
        this == DanceCategory.vienneseWaltz ||
        this == DanceCategory.slowFoxtrot ||
        this == DanceCategory.quickStep) {
      return true;
    }
    return false;
  }

  bool get isLatin => !isStandard;
}
