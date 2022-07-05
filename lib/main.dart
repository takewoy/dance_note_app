import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'repositories/isar/dance_note/dance_note.dart';
import 'repositories/isar/isar.dart';
import 'repositories/prefs/prefs_service.dart';
import 'utils/util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late final String saveDir;
  late final SharedPreferences prefs;
  late final Isar isar;

  // 非同期処理をまとめて実行
  await Future.wait([
    // SaveDirPath
    Future(() async {
      final dir = await getApplicationDocumentsDirectory();
      saveDir = dir.path;
    }),
    // SharedPreferences
    Future(() async => prefs = await SharedPreferences.getInstance()),
    // Isar
    Future(() async {
      isar = await Isar.open(
        schemas: [DanceNoteSchema],
        directory: (await getApplicationSupportDirectory()).path,
      );
    }),
  ]);

  runApp(
    ProviderScope(
      overrides: [
        saveDirProvider.overrideWithValue(saveDir),
        prefsProvider.overrideWithValue(PrefsService(prefs)),
        isarProvider.overrideWithValue(isar),
      ],
      child: const MyApp(),
    ),
  );
}
