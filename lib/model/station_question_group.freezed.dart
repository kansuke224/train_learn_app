// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_question_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StationQuestionGroup {
  String get questionGroupCode => throw _privateConstructorUsedError;
  String get questionGroupName => throw _privateConstructorUsedError;
  Map<String, StationQuestion> get questionMap =>
      throw _privateConstructorUsedError;
  AnswerScore get answerScore => throw _privateConstructorUsedError;
  List<TrainLine> get trainLineList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StationQuestionGroupCopyWith<StationQuestionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationQuestionGroupCopyWith<$Res> {
  factory $StationQuestionGroupCopyWith(StationQuestionGroup value,
          $Res Function(StationQuestionGroup) then) =
      _$StationQuestionGroupCopyWithImpl<$Res, StationQuestionGroup>;
  @useResult
  $Res call(
      {String questionGroupCode,
      String questionGroupName,
      Map<String, StationQuestion> questionMap,
      AnswerScore answerScore,
      List<TrainLine> trainLineList});

  $AnswerScoreCopyWith<$Res> get answerScore;
}

/// @nodoc
class _$StationQuestionGroupCopyWithImpl<$Res,
        $Val extends StationQuestionGroup>
    implements $StationQuestionGroupCopyWith<$Res> {
  _$StationQuestionGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionGroupCode = null,
    Object? questionGroupName = null,
    Object? questionMap = null,
    Object? answerScore = null,
    Object? trainLineList = null,
  }) {
    return _then(_value.copyWith(
      questionGroupCode: null == questionGroupCode
          ? _value.questionGroupCode
          : questionGroupCode // ignore: cast_nullable_to_non_nullable
              as String,
      questionGroupName: null == questionGroupName
          ? _value.questionGroupName
          : questionGroupName // ignore: cast_nullable_to_non_nullable
              as String,
      questionMap: null == questionMap
          ? _value.questionMap
          : questionMap // ignore: cast_nullable_to_non_nullable
              as Map<String, StationQuestion>,
      answerScore: null == answerScore
          ? _value.answerScore
          : answerScore // ignore: cast_nullable_to_non_nullable
              as AnswerScore,
      trainLineList: null == trainLineList
          ? _value.trainLineList
          : trainLineList // ignore: cast_nullable_to_non_nullable
              as List<TrainLine>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerScoreCopyWith<$Res> get answerScore {
    return $AnswerScoreCopyWith<$Res>(_value.answerScore, (value) {
      return _then(_value.copyWith(answerScore: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StationQuestionGroupCopyWith<$Res>
    implements $StationQuestionGroupCopyWith<$Res> {
  factory _$$_StationQuestionGroupCopyWith(_$_StationQuestionGroup value,
          $Res Function(_$_StationQuestionGroup) then) =
      __$$_StationQuestionGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionGroupCode,
      String questionGroupName,
      Map<String, StationQuestion> questionMap,
      AnswerScore answerScore,
      List<TrainLine> trainLineList});

  @override
  $AnswerScoreCopyWith<$Res> get answerScore;
}

/// @nodoc
class __$$_StationQuestionGroupCopyWithImpl<$Res>
    extends _$StationQuestionGroupCopyWithImpl<$Res, _$_StationQuestionGroup>
    implements _$$_StationQuestionGroupCopyWith<$Res> {
  __$$_StationQuestionGroupCopyWithImpl(_$_StationQuestionGroup _value,
      $Res Function(_$_StationQuestionGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionGroupCode = null,
    Object? questionGroupName = null,
    Object? questionMap = null,
    Object? answerScore = null,
    Object? trainLineList = null,
  }) {
    return _then(_$_StationQuestionGroup(
      questionGroupCode: null == questionGroupCode
          ? _value.questionGroupCode
          : questionGroupCode // ignore: cast_nullable_to_non_nullable
              as String,
      questionGroupName: null == questionGroupName
          ? _value.questionGroupName
          : questionGroupName // ignore: cast_nullable_to_non_nullable
              as String,
      questionMap: null == questionMap
          ? _value._questionMap
          : questionMap // ignore: cast_nullable_to_non_nullable
              as Map<String, StationQuestion>,
      answerScore: null == answerScore
          ? _value.answerScore
          : answerScore // ignore: cast_nullable_to_non_nullable
              as AnswerScore,
      trainLineList: null == trainLineList
          ? _value._trainLineList
          : trainLineList // ignore: cast_nullable_to_non_nullable
              as List<TrainLine>,
    ));
  }
}

/// @nodoc

class _$_StationQuestionGroup extends _StationQuestionGroup {
  const _$_StationQuestionGroup(
      {required this.questionGroupCode,
      required this.questionGroupName,
      required final Map<String, StationQuestion> questionMap,
      required this.answerScore,
      required final List<TrainLine> trainLineList})
      : _questionMap = questionMap,
        _trainLineList = trainLineList,
        super._();

  @override
  final String questionGroupCode;
  @override
  final String questionGroupName;
  final Map<String, StationQuestion> _questionMap;
  @override
  Map<String, StationQuestion> get questionMap {
    if (_questionMap is EqualUnmodifiableMapView) return _questionMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_questionMap);
  }

  @override
  final AnswerScore answerScore;
  final List<TrainLine> _trainLineList;
  @override
  List<TrainLine> get trainLineList {
    if (_trainLineList is EqualUnmodifiableListView) return _trainLineList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trainLineList);
  }

  @override
  String toString() {
    return 'StationQuestionGroup(questionGroupCode: $questionGroupCode, questionGroupName: $questionGroupName, questionMap: $questionMap, answerScore: $answerScore, trainLineList: $trainLineList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StationQuestionGroup &&
            (identical(other.questionGroupCode, questionGroupCode) ||
                other.questionGroupCode == questionGroupCode) &&
            (identical(other.questionGroupName, questionGroupName) ||
                other.questionGroupName == questionGroupName) &&
            const DeepCollectionEquality()
                .equals(other._questionMap, _questionMap) &&
            (identical(other.answerScore, answerScore) ||
                other.answerScore == answerScore) &&
            const DeepCollectionEquality()
                .equals(other._trainLineList, _trainLineList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionGroupCode,
      questionGroupName,
      const DeepCollectionEquality().hash(_questionMap),
      answerScore,
      const DeepCollectionEquality().hash(_trainLineList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationQuestionGroupCopyWith<_$_StationQuestionGroup> get copyWith =>
      __$$_StationQuestionGroupCopyWithImpl<_$_StationQuestionGroup>(
          this, _$identity);
}

abstract class _StationQuestionGroup extends StationQuestionGroup {
  const factory _StationQuestionGroup(
      {required final String questionGroupCode,
      required final String questionGroupName,
      required final Map<String, StationQuestion> questionMap,
      required final AnswerScore answerScore,
      required final List<TrainLine> trainLineList}) = _$_StationQuestionGroup;
  const _StationQuestionGroup._() : super._();

  @override
  String get questionGroupCode;
  @override
  String get questionGroupName;
  @override
  Map<String, StationQuestion> get questionMap;
  @override
  AnswerScore get answerScore;
  @override
  List<TrainLine> get trainLineList;
  @override
  @JsonKey(ignore: true)
  _$$_StationQuestionGroupCopyWith<_$_StationQuestionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
