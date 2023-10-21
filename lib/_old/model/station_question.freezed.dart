// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StationQuestion {
  Answer get answer => throw _privateConstructorUsedError;
  Station get station => throw _privateConstructorUsedError;
  StationButtonStyleInfo get stationButtonStyleInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StationQuestionCopyWith<StationQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationQuestionCopyWith<$Res> {
  factory $StationQuestionCopyWith(
          StationQuestion value, $Res Function(StationQuestion) then) =
      _$StationQuestionCopyWithImpl<$Res, StationQuestion>;
  @useResult
  $Res call(
      {Answer answer,
      Station station,
      StationButtonStyleInfo stationButtonStyleInfo});

  $AnswerCopyWith<$Res> get answer;
  $StationCopyWith<$Res> get station;
  $StationButtonStyleInfoCopyWith<$Res> get stationButtonStyleInfo;
}

/// @nodoc
class _$StationQuestionCopyWithImpl<$Res, $Val extends StationQuestion>
    implements $StationQuestionCopyWith<$Res> {
  _$StationQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? station = null,
    Object? stationButtonStyleInfo = null,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as Station,
      stationButtonStyleInfo: null == stationButtonStyleInfo
          ? _value.stationButtonStyleInfo
          : stationButtonStyleInfo // ignore: cast_nullable_to_non_nullable
              as StationButtonStyleInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerCopyWith<$Res> get answer {
    return $AnswerCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StationCopyWith<$Res> get station {
    return $StationCopyWith<$Res>(_value.station, (value) {
      return _then(_value.copyWith(station: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StationButtonStyleInfoCopyWith<$Res> get stationButtonStyleInfo {
    return $StationButtonStyleInfoCopyWith<$Res>(_value.stationButtonStyleInfo,
        (value) {
      return _then(_value.copyWith(stationButtonStyleInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StationQuestionCopyWith<$Res>
    implements $StationQuestionCopyWith<$Res> {
  factory _$$_StationQuestionCopyWith(
          _$_StationQuestion value, $Res Function(_$_StationQuestion) then) =
      __$$_StationQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Answer answer,
      Station station,
      StationButtonStyleInfo stationButtonStyleInfo});

  @override
  $AnswerCopyWith<$Res> get answer;
  @override
  $StationCopyWith<$Res> get station;
  @override
  $StationButtonStyleInfoCopyWith<$Res> get stationButtonStyleInfo;
}

/// @nodoc
class __$$_StationQuestionCopyWithImpl<$Res>
    extends _$StationQuestionCopyWithImpl<$Res, _$_StationQuestion>
    implements _$$_StationQuestionCopyWith<$Res> {
  __$$_StationQuestionCopyWithImpl(
      _$_StationQuestion _value, $Res Function(_$_StationQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? station = null,
    Object? stationButtonStyleInfo = null,
  }) {
    return _then(_$_StationQuestion(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as Station,
      stationButtonStyleInfo: null == stationButtonStyleInfo
          ? _value.stationButtonStyleInfo
          : stationButtonStyleInfo // ignore: cast_nullable_to_non_nullable
              as StationButtonStyleInfo,
    ));
  }
}

/// @nodoc

class _$_StationQuestion extends _StationQuestion {
  const _$_StationQuestion(
      {required this.answer,
      required this.station,
      required this.stationButtonStyleInfo})
      : super._();

  @override
  final Answer answer;
  @override
  final Station station;
  @override
  final StationButtonStyleInfo stationButtonStyleInfo;

  @override
  String toString() {
    return 'StationQuestion(answer: $answer, station: $station, stationButtonStyleInfo: $stationButtonStyleInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StationQuestion &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.stationButtonStyleInfo, stationButtonStyleInfo) ||
                other.stationButtonStyleInfo == stationButtonStyleInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, answer, station, stationButtonStyleInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationQuestionCopyWith<_$_StationQuestion> get copyWith =>
      __$$_StationQuestionCopyWithImpl<_$_StationQuestion>(this, _$identity);
}

abstract class _StationQuestion extends StationQuestion {
  const factory _StationQuestion(
          {required final Answer answer,
          required final Station station,
          required final StationButtonStyleInfo stationButtonStyleInfo}) =
      _$_StationQuestion;
  const _StationQuestion._() : super._();

  @override
  Answer get answer;
  @override
  Station get station;
  @override
  StationButtonStyleInfo get stationButtonStyleInfo;
  @override
  @JsonKey(ignore: true)
  _$$_StationQuestionCopyWith<_$_StationQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
