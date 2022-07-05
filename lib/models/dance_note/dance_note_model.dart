import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/dance_category.dart';
import '../../repositories/isar/dance_note/dance_note.dart';

part 'dance_note_model.freezed.dart';
part 'dance_note_model.g.dart';

@freezed
class DanceNoteModel with _$DanceNoteModel {
  const factory DanceNoteModel({
    @Default(null) int? id, // idはIsarが自動生成するので初期値nullでOK
    required DateTime createdAt,
    required DateTime editedAt,
    @Default(DanceCategory.waltz) DanceCategory category,
    @Default('') String picOne,
    @Default('') String picTwo,
    @Default('') String picThree,
    @Default('') String picFour,
    @Default('') String note,
  }) = _DanceNoteModel;
  const DanceNoteModel._();

  factory DanceNoteModel.fromJson(Map<String, dynamic> json) =>
      _$DanceNoteModelFromJson(json);

  List<String> get notEmptyPics {
    final files = [picOne, picTwo, picThree, picFour];
    return [
      for (final file in files)
        if (file.isNotEmpty) file,
    ];
  }

  /// freezedのモデルからIsarに保存するデータに変換する
  DanceNote toDanceNote(DanceNote? danceNote) {
    final now = DateTime.now();
    if (danceNote == null) {
      // 新規作成の場合
      return DanceNote()
        ..id = id
        ..createdAt = now
        ..editedAt = now
        ..category = category
        ..picOne = picOne
        ..picTwo = picTwo
        ..picThree = picThree
        ..picFour = picFour
        ..note = note;
    } else {
      // 編集の時は、`editedAt`だけ現在のDateTimeを入れる
      return DanceNote()
        ..id = id
        ..createdAt = danceNote.createdAt
        ..editedAt = now
        ..category = category
        ..picOne = picOne
        ..picTwo = picTwo
        ..picThree = picThree
        ..picFour = picFour
        ..note = note;
    }
  }
}
