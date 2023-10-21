// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Station {
  String get name => throw _privateConstructorUsedError;
  List<TrainLine> get trainLineList => throw _privateConstructorUsedError;
  List<String> get shortNameList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StationCopyWith<Station> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationCopyWith<$Res> {
  factory $StationCopyWith(Station value, $Res Function(Station) then) =
      _$StationCopyWithImpl<$Res, Station>;
  @useResult
  $Res call(
      {String name, List<TrainLine> trainLineList, List<String> shortNameList});
}

/// @nodoc
class _$StationCopyWithImpl<$Res, $Val extends Station>
    implements $StationCopyWith<$Res> {
  _$StationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? trainLineList = null,
    Object? shortNameList = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      trainLineList: null == trainLineList
          ? _value.trainLineList
          : trainLineList // ignore: cast_nullable_to_non_nullable
              as List<TrainLine>,
      shortNameList: null == shortNameList
          ? _value.shortNameList
          : shortNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StationCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$$_StationCopyWith(
          _$_Station value, $Res Function(_$_Station) then) =
      __$$_StationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, List<TrainLine> trainLineList, List<String> shortNameList});
}

/// @nodoc
class __$$_StationCopyWithImpl<$Res>
    extends _$StationCopyWithImpl<$Res, _$_Station>
    implements _$$_StationCopyWith<$Res> {
  __$$_StationCopyWithImpl(_$_Station _value, $Res Function(_$_Station) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? trainLineList = null,
    Object? shortNameList = null,
  }) {
    return _then(_$_Station(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      trainLineList: null == trainLineList
          ? _value._trainLineList
          : trainLineList // ignore: cast_nullable_to_non_nullable
              as List<TrainLine>,
      shortNameList: null == shortNameList
          ? _value._shortNameList
          : shortNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Station extends _Station {
  const _$_Station(
      {required this.name,
      required final List<TrainLine> trainLineList,
      required final List<String> shortNameList})
      : _trainLineList = trainLineList,
        _shortNameList = shortNameList,
        super._();

  @override
  final String name;
  final List<TrainLine> _trainLineList;
  @override
  List<TrainLine> get trainLineList {
    if (_trainLineList is EqualUnmodifiableListView) return _trainLineList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trainLineList);
  }

  final List<String> _shortNameList;
  @override
  List<String> get shortNameList {
    if (_shortNameList is EqualUnmodifiableListView) return _shortNameList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shortNameList);
  }

  @override
  String toString() {
    return 'Station(name: $name, trainLineList: $trainLineList, shortNameList: $shortNameList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Station &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._trainLineList, _trainLineList) &&
            const DeepCollectionEquality()
                .equals(other._shortNameList, _shortNameList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_trainLineList),
      const DeepCollectionEquality().hash(_shortNameList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationCopyWith<_$_Station> get copyWith =>
      __$$_StationCopyWithImpl<_$_Station>(this, _$identity);
}

abstract class _Station extends Station {
  const factory _Station(
      {required final String name,
      required final List<TrainLine> trainLineList,
      required final List<String> shortNameList}) = _$_Station;
  const _Station._() : super._();

  @override
  String get name;
  @override
  List<TrainLine> get trainLineList;
  @override
  List<String> get shortNameList;
  @override
  @JsonKey(ignore: true)
  _$$_StationCopyWith<_$_Station> get copyWith =>
      throw _privateConstructorUsedError;
}
