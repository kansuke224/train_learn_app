// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'train_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrainLine {
  String get name => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainLineCopyWith<TrainLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainLineCopyWith<$Res> {
  factory $TrainLineCopyWith(TrainLine value, $Res Function(TrainLine) then) =
      _$TrainLineCopyWithImpl<$Res, TrainLine>;
  @useResult
  $Res call({String name, Color color});
}

/// @nodoc
class _$TrainLineCopyWithImpl<$Res, $Val extends TrainLine>
    implements $TrainLineCopyWith<$Res> {
  _$TrainLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainLineCopyWith<$Res> implements $TrainLineCopyWith<$Res> {
  factory _$$_TrainLineCopyWith(
          _$_TrainLine value, $Res Function(_$_TrainLine) then) =
      __$$_TrainLineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Color color});
}

/// @nodoc
class __$$_TrainLineCopyWithImpl<$Res>
    extends _$TrainLineCopyWithImpl<$Res, _$_TrainLine>
    implements _$$_TrainLineCopyWith<$Res> {
  __$$_TrainLineCopyWithImpl(
      _$_TrainLine _value, $Res Function(_$_TrainLine) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$_TrainLine(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_TrainLine extends _TrainLine {
  const _$_TrainLine({required this.name, required this.color}) : super._();

  @override
  final String name;
  @override
  final Color color;

  @override
  String toString() {
    return 'TrainLine(name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainLine &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainLineCopyWith<_$_TrainLine> get copyWith =>
      __$$_TrainLineCopyWithImpl<_$_TrainLine>(this, _$identity);
}

abstract class _TrainLine extends TrainLine {
  const factory _TrainLine(
      {required final String name, required final Color color}) = _$_TrainLine;
  const _TrainLine._() : super._();

  @override
  String get name;
  @override
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$_TrainLineCopyWith<_$_TrainLine> get copyWith =>
      throw _privateConstructorUsedError;
}
