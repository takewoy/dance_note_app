// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/dance_category.dart';

part 'visible_dance.freezed.dart';
part 'visible_dance.g.dart';

/// ユーザーによっては専攻があり、
/// 10種目やる人
/// スタンダード5種目だけやる人
/// ラテン5種目だけやる人がいるので、
/// TabBarの表示非表示を切り替えられるようにする
@freezed
class VisibleDance with _$VisibleDance {
  const factory VisibleDance({
    @Default(DanceCategory.waltz) DanceCategory category,
    @Default(true) bool visible,
  }) = _VisibleDance;
  const VisibleDance._();

  factory VisibleDance.fromJson(Map<String, dynamic> json) =>
      _$VisibleDanceFromJson(json);
}
