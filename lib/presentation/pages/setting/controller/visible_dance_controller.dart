import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../enums/dance_category.dart';
import '../../../../models/visible_dance/visible_dance.dart';
import '../../../../repositories/prefs/prefs_service.dart';

/// ユーザーごとに表示するダンス種目を選べるようにする
/// そういえばこっちはSharedPreferences使っちゃってる
final visibleDanceProvider =
    StateNotifierProvider<VisibleDanceController, List<VisibleDance>>(
  (ref) => VisibleDanceController(ref.read),
);

class VisibleDanceController extends StateNotifier<List<VisibleDance>> {
  VisibleDanceController(this._read) : super([]) {
    _init();
  }
  final Reader _read;
  late final _prefs = _read(prefsProvider);

  void _init() {
    state = [
      for (final dance in DanceCategory.values)
        VisibleDance(
          category: dance,
          visible: _prefs.getVisibleDance(dance.prefsKey) ?? true,
        )
    ];
  }

  Future<bool> toggle({
    required VisibleDance dance,
    required bool visible,
  }) async {
    // 変更する種目のインデックス
    final index = dance.category.index;
    // 現在のStateをコピーして入れ替え
    state = [...state]..replaceRange(
        index,
        index + 1,
        [dance.copyWith(visible: visible)],
      );
    return _prefs.saveVisibleDance(dance.category.prefsKey, visible);
  }
}
