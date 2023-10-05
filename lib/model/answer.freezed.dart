// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Answer {
// 解答済みかどうか
  bool get isFinished => throw _privateConstructorUsedError; // 解答した駅名
  String get answerName => throw _privateConstructorUsedError; // 解答結果
  bool get answerResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call({bool isFinished, String answerName, bool answerResult});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFinished = null,
    Object? answerName = null,
    Object? answerResult = null,
  }) {
    return _then(_value.copyWith(
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      answerName: null == answerName
          ? _value.answerName
          : answerName // ignore: cast_nullable_to_non_nullable
              as String,
      answerResult: null == answerResult
          ? _value.answerResult
          : answerResult // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFinished, String answerName, bool answerResult});
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$_Answer>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFinished = null,
    Object? answerName = null,
    Object? answerResult = null,
  }) {
    return _then(_$_Answer(
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      answerName: null == answerName
          ? _value.answerName
          : answerName // ignore: cast_nullable_to_non_nullable
              as String,
      answerResult: null == answerResult
          ? _value.answerResult
          : answerResult // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Answer extends _Answer {
  const _$_Answer(
      {required this.isFinished,
      required this.answerName,
      required this.answerResult})
      : super._();

// 解答済みかどうか
  @override
  final bool isFinished;
// 解答した駅名
  @override
  final String answerName;
// 解答結果
  @override
  final bool answerResult;

  @override
  String toString() {
    return 'Answer(isFinished: $isFinished, answerName: $answerName, answerResult: $answerResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.answerName, answerName) ||
                other.answerName == answerName) &&
            (identical(other.answerResult, answerResult) ||
                other.answerResult == answerResult));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFinished, answerName, answerResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);
}

abstract class _Answer extends Answer {
  const factory _Answer(
      {required final bool isFinished,
      required final String answerName,
      required final bool answerResult}) = _$_Answer;
  const _Answer._() : super._();

  @override // 解答済みかどうか
  bool get isFinished;
  @override // 解答した駅名
  String get answerName;
  @override // 解答結果
  bool get answerResult;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
