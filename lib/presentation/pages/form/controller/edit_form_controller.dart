import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

import '../../../../enums/dance_category.dart';
import '../../../../models/dance_note/dance_note_model.dart';
import '../../../../repositories/isar/dance_note/dance_note.dart';
import '../../../../repositories/isar/isar.dart';
import '../../../../utils/util.dart';
import '../../setting/controller/visible_dance_controller.dart';

/// EditFom用の`GlobalKey<FormState>`
final formKeyProvider = Provider((_) => GlobalKey<FormState>());

/// 新規作成の場合はnullで既存の[DanceNote]の編集の場合は[DanceNote]をOverrideする
final editNoteProvider = Provider<DanceNote?>((_) => null);

/// `EditForm`で編集の状態を管理するための[StateNotifierProvider]
final editFormProvider =
    StateNotifierProvider.autoDispose<EditFormController, DanceNoteModel>(
  (ref) {
    final note = ref.watch(editNoteProvider);
    return EditFormController(ref.read, note);
  },
  dependencies: [
    // Overrideするので
    editNoteProvider,
    // 以下はEditFormController内で使用するので
    visibleDanceProvider,
    formKeyProvider,
    recordDanceNoteProvider,
    isMobileProvider,
    deletePicFromDiscProvider,
    saveImageProvider,
    saveDirProvider,
  ],
);

class EditFormController extends StateNotifier<DanceNoteModel> {
  EditFormController(this._read, this._note)
      : super(
          DanceNoteModel(
            createdAt: DateTime.now(),
            editedAt: DateTime.now(),
          ),
        ) {
    _init();
  }

  final Reader _read;
  final DanceNote? _note;

  static final _deletePics = <String>[]; // 削除する写真を保持して削除+保存で削除実行

  void _init() {
    final note = _note; // for null check
    if (note != null) {
      // 既存データの編集の場合
      final dir = _read(saveDirProvider);
      state = state.copyWith(
        id: note.id,
        createdAt: note.createdAt,
        editedAt: note.editedAt,
        category: note.category,
        picOne: note.picOne.isEmpty ? '' : '$dir/${basename(note.picOne)}',
        picTwo: note.picTwo.isEmpty ? '' : '$dir/${basename(note.picTwo)}',
        picThree:
            note.picThree.isEmpty ? '' : '$dir/${basename(note.picThree)}',
        picFour: note.picFour.isEmpty ? '' : '$dir/${basename(note.picFour)}',
        note: note.note,
      );
    } else {
      // 新規作成の場合
      // 種目は初期値をwaltzにしているが、ユーザーによってはwaltzは非表示にしている可能性があるので
      // `visibleDanceProvider`から有効にしている種目の1つ目を選択する
      final dances = _read(visibleDanceProvider);
      final visibleDance = dances.firstWhere((dance) => dance.visible);
      state = state.copyWith(category: visibleDance.category);
    }
  }

  void setCategory(DanceCategory category) {
    state = state.copyWith(category: category);
  }

  /// モバイルの場合は[ImagePicker]を使用して写真を選択する
  /// デスクトップの場合は[ImagePicker]が使用できないので[FilePicker]を使用する
  Future<String?> _saveImagePickerFile(ImageSource source) async {
    final picker = _read(saveImageProvider);
    final image = await picker(source);
    return image;
  }

  Future<void> setPicOne(ImageSource source) async {
    final result = await _saveImagePickerFile(source);
    if (result != null) {
      state = state.copyWith(picOne: result);
    }
  }

  Future<void> setPicTwo(ImageSource source) async {
    final result = await _saveImagePickerFile(source);
    if (result != null) {
      state = state.copyWith(picTwo: result);
    }
  }

  Future<void> setPicThree(ImageSource source) async {
    final result = await _saveImagePickerFile(source);
    if (result != null) {
      state = state.copyWith(picThree: result);
    }
  }

  Future<void> setPicFour(ImageSource source) async {
    final result = await _saveImagePickerFile(source);
    if (result != null) {
      state = state.copyWith(picFour: result);
    }
  }

  Future<void> deletePicOne(String path) async {
    _deletePics.add(path);
    state = state.copyWith(picOne: '');
  }

  Future<void> deletePicTwo(String path) async {
    _deletePics.add(path);
    state = state.copyWith(picTwo: '');
  }

  Future<void> deletePicThree(String path) async {
    _deletePics.add(path);
    state = state.copyWith(picThree: '');
  }

  Future<void> deletePicFour(String path) async {
    _deletePics.add(path);
    state = state.copyWith(picFour: '');
  }

  void setNote(String? value) {
    state = state.copyWith(note: value ?? '');
  }

  Future<bool> save() async {
    final formKey = _read(formKeyProvider);
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      // 取得した写真を保存する
      final dir = _read(saveDirProvider);
      for (final pic in state.notEmptyPics) {
        if (pic.isNotEmpty) {
          final fileName = basename(pic);
          final savePath = '$dir/$fileName';
          await File(pic).copy(savePath);
        }
      }

      // [DanceNote]の保存
      final add = _read(recordDanceNoteProvider);
      await add(state.toDanceNote(_note));

      // 写真の削除がある場合はここで削除
      final delete = _read(deletePicFromDiscProvider);
      for (final pic in _deletePics) {
        await delete(pic);
      }
      return true;
    }
    return false;
  }
}
