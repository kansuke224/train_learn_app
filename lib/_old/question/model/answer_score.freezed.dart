// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnswerScore {
// 正当数
  int get thisScore => throw _privateConstructorUsedError; // ベスト正当数
  int get bestScore => throw _privateConstructorUsedError; // questionGroupCode
  String get questionGroupCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerScoreCopyWith<AnswerScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerScoreCopyWith<$Res> {
  factory $AnswerScoreCopyWith(
          AnswerScore value, $Res Function(AnswerScore) then) =
      _$AnswerScoreCopyWithImpl<$Res, AnswerScore>;
  @useResult
  $Res call({int thisScore, int bestScore, String questionGroupCode});
}

/// @nodoc
class _$AnswerScoreCopyWithImpl<$Res, $Val extends AnswerScore>
    implements $AnswerScoreCopyWith<$Res> {
  _$AnswerScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thisScore = null,
    Object? bestScore = null,
    Object? questionGroupCode = null,
  }) {
    return _then(_value.copyWith(
      thisScore: null == thisScore
          ? _value.thisScore
          : thisScore // ignore: cast_nullable_to_non_nullable
              as int,
      bestScore: null == bestScore
          ? _value.bestScore
          : bestScore // ignore: cast_nullable_to_non_nullable
              as int,
      questionGroupCode: null == questionGroupCode
          ? _value.questionGroupCode
          : questionGroupCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerScoreCopyWith<$Res>
    implements $AnswerScoreCopyWith<$Res> {
  factory _$$_AnswerScoreCopyWith(
          _$_AnswerScore value, $Res Function(_$_AnswerScore) then) =
      __$$_AnswerScoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int thisScore, int bestScore, String questionGroupCode});
}

/// @nodoc
class __$$_AnswerScoreCopyWithImpl<$Res>
    extends _$AnswerScoreCopyWithImpl<$Res, _$_AnswerScore>
    implements _$$_AnswerScoreCopyWith<$Res> {
  __$$_AnswerScoreCopyWithImpl(
      _$_AnswerScore _value, $Res Function(_$_AnswerScore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thisScore = null,
    Object? bestScore = null,
    Object? questionGroupCode = null,
  }) {
    return _then(_$_AnswerScore(
      thisScore: null == thisScore
          ? _value.thisScore
          : thisScore // ignore: cast_nullable_to_non_nullable
              as int,
      bestScore: null == bestScore
          ? _value.bestScore
          : bestScore // ignore: cast_nullable_to_non_nullable
              as int,
      questionGroupCode: null == questionGroupCode
          ? _value.questionGroupCode
          : questionGroupCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AnswerScore extends _AnswerScore {
  const _$_AnswerScore(
      {required this.thisScore,
      required this.bestScore,
      required this.questionGroupCode})
      : super._();

// 正当数
  @override
  final int thisScore;
// ベスト正当数
  @override
  final int bestScore;
// questionGroupCode
  @override
  final String questionGroupCode;

  @override
  String toString() {
    return 'AnswerScore(thisScore: $thisScore, bestScore: $bestScore, questionGroupCode: $questionGroupCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerScore &&
            (identical(other.thisScore, thisScore) ||
                other.thisScore == thisScore) &&
            (identical(other.bestScore, bestScore) ||
                other.bestScore == bestScore) &&
            (identical(other.questionGroupCode, questionGroupCode) ||
                other.questionGroupCode == questionGroupCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, thisScore, bestScore, questionGroupCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerScoreCopyWith<_$_AnswerScore> get copyWith =>
      __$$_AnswerScoreCopyWithImpl<_$_AnswerScore>(this, _$identity);
}

abstract class _AnswerScore extends AnswerScore {
  const factory _AnswerScore(
      {required final int thisScore,
      required final int bestScore,
      required final String questionGroupCode}) = _$_AnswerScore;
  const _AnswerScore._() : super._();

  @override // 正当数
  int get thisScore;
  @override // ベスト正当数
  int get bestScore;
  @override // questionGroupCode
  String get questionGroupCode;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerScoreCopyWith<_$_AnswerScore> get copyWith =>
      throw _privateConstructorUsedError;
}
