import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_io/io.dart';

import '../extensions/dance_note_x.dart';
import '../repositories/isar/dance_note/dance_note.dart';

final scaffoldKeyProvider = Provider(
  (_) => GlobalKey<ScaffoldMessengerState>(),
);

final showSnackBarProvider = Provider((ref) {
  final key = ref.watch(scaffoldKeyProvider);
  return (String message, {bool useErrorColor = false}) =>
      key.currentState?.showSnackBar(
        SnackBar(
          backgroundColor: useErrorColor ? Colors.redAccent : null,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text(message),
          action: SnackBarAction(
            onPressed: () => key.currentState?.hideCurrentSnackBar(),
            label: 'OK',
          ),
        ),
      );
});

/// OS判定用
final isMobileProvider = Provider((_) {
  if (kIsWeb) {
    return false; // Webは最上位で判定した方が良さげ??
  } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    return false;
  }
  return true;
});

/// 写真を保存するディレクトリのパス
final saveDirProvider = Provider<String>((_) => throw UnimplementedError());

/// 写真を取得する
final saveImageProvider = Provider((ref) {
  final isMobile = ref.watch(isMobileProvider);
  return (ImageSource source) async {
    if (isMobile) {
      final picker = ref.read(imagePickerProvider);
      final image = await picker(source);
      return image;
    } else {
      final picker = ref.read(filePickerProvider);
      final image = await picker();
      return image;
    }
  };
});

final imagePickerProvider = Provider((_) {
  final imagePicker = ImagePicker();
  return (ImageSource source) async {
    final image = await imagePicker.pickImage(source: source);
    return image?.path;
  };
});

final filePickerProvider = Provider((_) {
  final filePicker = FilePicker.platform;
  return () async {
    final result = await filePicker.pickFiles(type: FileType.image);
    return result?.files.single.path;
  };
});

final inputValidatorProvider = Provider((_) {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return '入力されていません。';
    }
    return null;
  };
});

/// 年月日日時秒を表示する[DateFormat]
final formatterProvider = Provider((_) => DateFormat('yyyy-MM-dd HH:mm:ss'));

/// share_plusパッケージを使用して[DanceNote]を共有する
final shareNoteProvider = Provider((_) {
  return (DanceNote note) async {
    final existFiles = note.files.where((file) => file.isNotEmpty);
    if (existFiles.isNotEmpty) {
      await Share.shareFiles(
        existFiles.toList(),
        subject: note.category.label,
        text: note.note,
      );
    }
  };
});

/// アプリ内のディレクトリから写真を削除する
final deletePicFromDiscProvider = Provider((ref) {
  return (String path) async {
    final dir = ref.read(saveDirProvider);
    final fileName = basename(path);
    final file = File('$dir/$fileName');
    final isExist = file.existsSync();
    if (isExist) {
      if (kDebugMode) {
        print('delete picture');
      }
      await file.delete();
    }
  };
});
