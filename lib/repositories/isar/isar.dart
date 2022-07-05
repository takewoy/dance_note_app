import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

import '../../extensions/dance_note_x.dart';
import '../../utils/util.dart';
import 'dance_note/dance_note.dart';

final isarProvider = Provider<Isar>((_) => throw UnimplementedError());

/// [Isar]に書き込みをする
/// idがnullの場合は新規作成、値が格納されている場合は編集で、[Isar]に上書き保存される
final recordDanceNoteProvider = Provider((ref) {
  final isar = ref.watch(isarProvider);
  return (DanceNote danceNote) async {
    if (danceNote.id == null) {
      // 新規作成
      await isar.writeTxn((isar) async {
        await isar.danceNotes.put(danceNote);
      });
    } else {
      // 編集
      await isar.writeTxn((isar) async {
        danceNote.id = await isar.danceNotes.put(danceNote);
      });
    }
  };
});

/// [Isar]からデータを削除する
/// 端末内に保存している写真のデータも削除する
final deleteDanceNoteProvider = Provider((ref) {
  final isar = ref.watch(isarProvider);
  final delete = ref.watch(deletePicFromDiscProvider);
  return (DanceNote danceNote) async {
    final id = danceNote.id;
    if (id == null) {
      if (kDebugMode) {
        print('deleteDanceNoteProvider: id is null');
      }
      return false; // null checkも兼ねて
    }

    final pics = danceNote.files.where((e) => e.isNotEmpty);

    try {
      for (final pic in pics) {
        await delete(pic);
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {} // 特に何もしない
    return isar.writeTxn((isar) async => isar.danceNotes.delete(id));
  };
});

/// 検索ページで使用する
/// [Isar]から検索
final filteredIsarDanceNoteProvider =
    FutureProvider.family.autoDispose((ref, String text) {
  final isar = ref.watch(isarProvider);
  return isar.txn(
    (isar) async => isar.danceNotes
        .filter()
        .noteContains(text)
        .sortByEditedAtDesc()
        .findAll(),
  );
});
