// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dance_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DanceNoteModel _$$_DanceNoteModelFromJson(Map<String, dynamic> json) =>
    _$_DanceNoteModel(
      id: json['id'] as int? ?? null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      editedAt: DateTime.parse(json['editedAt'] as String),
      category: $enumDecodeNullable(_$DanceCategoryEnumMap, json['category']) ??
          DanceCategory.waltz,
      picOne: json['picOne'] as String? ?? '',
      picTwo: json['picTwo'] as String? ?? '',
      picThree: json['picThree'] as String? ?? '',
      picFour: json['picFour'] as String? ?? '',
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$_DanceNoteModelToJson(_$_DanceNoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'editedAt': instance.editedAt.toIso8601String(),
      'category': _$DanceCategoryEnumMap[instance.category],
      'picOne': instance.picOne,
      'picTwo': instance.picTwo,
      'picThree': instance.picThree,
      'picFour': instance.picFour,
      'note': instance.note,
    };

const _$DanceCategoryEnumMap = {
  DanceCategory.waltz: 'waltz',
  DanceCategory.tango: 'tango',
  DanceCategory.vienneseWaltz: 'vienneseWaltz',
  DanceCategory.slowFoxtrot: 'slowFoxtrot',
  DanceCategory.quickStep: 'quickStep',
  DanceCategory.samba: 'samba',
  DanceCategory.chaChaCha: 'chaChaCha',
  DanceCategory.rumba: 'rumba',
  DanceCategory.pasoDoble: 'pasoDoble',
  DanceCategory.jive: 'jive',
};
