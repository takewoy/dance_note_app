// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visible_dance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisibleDance _$VisibleDanceFromJson(Map<String, dynamic> json) {
  return _VisibleDance.fromJson(json);
}

/// @nodoc
mixin _$VisibleDance {
  DanceCategory get category => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisibleDanceCopyWith<VisibleDance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisibleDanceCopyWith<$Res> {
  factory $VisibleDanceCopyWith(
          VisibleDance value, $Res Function(VisibleDance) then) =
      _$VisibleDanceCopyWithImpl<$Res>;
  $Res call({DanceCategory category, bool visible});
}

/// @nodoc
class _$VisibleDanceCopyWithImpl<$Res> implements $VisibleDanceCopyWith<$Res> {
  _$VisibleDanceCopyWithImpl(this._value, this._then);

  final VisibleDance _value;
  // ignore: unused_field
  final $Res Function(VisibleDance) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? visible = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as DanceCategory,
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_VisibleDanceCopyWith<$Res>
    implements $VisibleDanceCopyWith<$Res> {
  factory _$$_VisibleDanceCopyWith(
          _$_VisibleDance value, $Res Function(_$_VisibleDance) then) =
      __$$_VisibleDanceCopyWithImpl<$Res>;
  @override
  $Res call({DanceCategory category, bool visible});
}

/// @nodoc
class __$$_VisibleDanceCopyWithImpl<$Res>
    extends _$VisibleDanceCopyWithImpl<$Res>
    implements _$$_VisibleDanceCopyWith<$Res> {
  __$$_VisibleDanceCopyWithImpl(
      _$_VisibleDance _value, $Res Function(_$_VisibleDance) _then)
      : super(_value, (v) => _then(v as _$_VisibleDance));

  @override
  _$_VisibleDance get _value => super._value as _$_VisibleDance;

  @override
  $Res call({
    Object? category = freezed,
    Object? visible = freezed,
  }) {
    return _then(_$_VisibleDance(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as DanceCategory,
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisibleDance extends _VisibleDance with DiagnosticableTreeMixin {
  const _$_VisibleDance(
      {this.category = DanceCategory.waltz, this.visible = true})
      : super._();

  factory _$_VisibleDance.fromJson(Map<String, dynamic> json) =>
      _$$_VisibleDanceFromJson(json);

  @override
  @JsonKey()
  final DanceCategory category;
  @override
  @JsonKey()
  final bool visible;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VisibleDance(category: $category, visible: $visible)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VisibleDance'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('visible', visible));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisibleDance &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.visible, visible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(visible));

  @JsonKey(ignore: true)
  @override
  _$$_VisibleDanceCopyWith<_$_VisibleDance> get copyWith =>
      __$$_VisibleDanceCopyWithImpl<_$_VisibleDance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisibleDanceToJson(this);
  }
}

abstract class _VisibleDance extends VisibleDance {
  const factory _VisibleDance(
      {final DanceCategory category, final bool visible}) = _$_VisibleDance;
  const _VisibleDance._() : super._();

  factory _VisibleDance.fromJson(Map<String, dynamic> json) =
      _$_VisibleDance.fromJson;

  @override
  DanceCategory get category => throw _privateConstructorUsedError;
  @override
  bool get visible => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VisibleDanceCopyWith<_$_VisibleDance> get copyWith =>
      throw _privateConstructorUsedError;
}
