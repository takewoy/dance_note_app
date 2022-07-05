import 'package:isar/isar.dart';

import '../../../enums/dance_category.dart';

part 'dance_note.g.dart';

/// ダンスノートには何が必要か？？
///
/// 作成日
/// 種目
/// 動画ファイル×2
/// 写真×4
/// ノート（テキスト）Max255
/// タスク　String bool
/// タスクの数　デフォルト５

@Collection()
class DanceNote {
  @Id()
  int? id;

  late DateTime createdAt;

  late DateTime editedAt;

  @DanceCategoryConverter()
  late DanceCategory category;

  late String picOne;

  late String picTwo;

  late String picThree;

  late String picFour;

  @Index()
  late String note;
}

class DanceCategoryConverter extends TypeConverter<DanceCategory, int> {
  const DanceCategoryConverter();
  @override
  DanceCategory fromIsar(int object) {
    return DanceCategory.values[object];
  }

  @override
  int toIsar(DanceCategory object) {
    return object.index;
  }
}
