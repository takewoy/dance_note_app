// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visible_dance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisibleDance _$$_VisibleDanceFromJson(Map<String, dynamic> json) =>
    _$_VisibleDance(
      category: $enumDecodeNullable(_$DanceCategoryEnumMap, json['category']) ??
          DanceCategory.waltz,
      visible: json['visible'] as bool? ?? true,
    );

Map<String, dynamic> _$$_VisibleDanceToJson(_$_VisibleDance instance) =>
    <String, dynamic>{
      'category': _$DanceCategoryEnumMap[instance.category],
      'visible': instance.visible,
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
