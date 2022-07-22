import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../enums/dance_category.dart';
import '../../../../repositories/isar/dance_note/dance_note.dart';
import '../../../../repositories/isar/isar.dart';

/// HomeTabBarViewで利用するtabIndex
/// Web対応したいのでNestedRouteにも利用したいところ
final tabIndexProvider = StateProvider.autoDispose((_) => 0);

/// HomeTabBarView内のListViewでOverride
final indexedNoteProvider = Provider<DanceNote>(
  (_) => throw UnimplementedError(),
);

/// UI側では`danceNoteProvider`の状態を取得しないので、`AsyncLoading`かどうかを取得する
final isLoadingNoteProvider = Provider.autoDispose(
  (ref) => ref.watch(danceNoteProvider) is AsyncLoading,
);

/// `danceNoteProvider`から一致する[DanceCategory]をフィルタリングして返す
/// errorの場合はnullを返し、HomeTabBarViewで
/// エラーの時は`ref.invalidate(danceNoteProvider)`を実行するボタンを表示する
final filteredDanceNoteProvider =
    Provider.family.autoDispose((ref, DanceCategory category) {
  return ref.watch(danceNoteProvider).when(
        data: (data) => data.where((e) => e.category == category).toList(),
        error: (err, stack) => null,
        loading: () => <DanceNote>[],
      );
});

/// IsarからDanceNoteをリアルタイムに変更を取得する
///
/// `await for　〜 yield`を使って下のようにも書けるけど
/// ```dart
/// await for(final note in notes.watch()) {
///     yield note;
/// }
/// ```
/// [StreamSubscription]の方がミスを起こしにくいので`notes.watch().listen ~`を使用
final danceNoteProvider = StreamProvider.autoDispose<List<DanceNote>>(
  (ref) async* {
    final StreamSubscription<List<DanceNote>> subscription;
    ref.state = const AsyncValue.loading();
    final isar = ref.watch(isarProvider);
    final notes = isar.danceNotes.where().anyId().sortByCreatedAtDesc().build();
    final initialData = await notes.findAll();
    // `notes.watch().listen`は変更があった時しか値を返さないので
    // 起動直後に取得したデータを入れる
    ref.state = AsyncValue.data(initialData);

    // Isarの変更をリッスンして変更されたらStateを変更する
    subscription = notes.watch().listen(
      (event) => ref.state = AsyncValue.data(event),
      onError: (Object err) {
        ref.state = const AsyncValue.error('error');
        if (kDebugMode) {
          print('danceNoteProvider error: $err');
        }
      },
    );
    ref.onDispose(subscription.cancel);
  },
);
