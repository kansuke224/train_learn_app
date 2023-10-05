import 'package:flutter/material.dart';
import 'package:interactive_viewer_01/enum/station_code.dart';
import 'package:interactive_viewer_01/model/train_line.dart';
import 'package:interactive_viewer_01/style/custom_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'station.freezed.dart';

// 駅
@freezed
class Station with _$Station {
  const Station._();

  const factory Station({
    required StationCode stationCode,
    required String name,
    required Offset centerPosition,
    required MaterialColor color,
    required double width,
    required double height,
    required double borderRadius,
    required List<TrainLine> trainLineList,
    required List<String> shortNameList,
    @Default(false) bool isSelected,
    @Default(false) bool isAnswred,
  }) = _Station;

  // 円形の駅
  factory Station.createCircleStation({
    required stationCode,
    required name,
    required centerPosition,
    required color,
    required trainLineList,
    required shortNameList,
  }) {
    return Station(
      stationCode: stationCode,
      name: name,
      centerPosition: centerPosition,
      color: color,
      width: 18,
      height: 18,
      borderRadius: 9,
      trainLineList: trainLineList,
      shortNameList: shortNameList,
    );
  }

  // 四角形の駅(複数の路線が通っている駅に利用する)
  factory Station.createSquareStation({
    required stationCode,
    required name,
    required centerPosition,
    required color,
    required width,
    required trainLineList,
    required shortNameList,
  }) {
    return Station(
      stationCode: stationCode,
      name: name,
      centerPosition: centerPosition,
      color: color,
      width: width,
      height: 14,
      borderRadius: 10,
      trainLineList: trainLineList,
      shortNameList: shortNameList,
    );
  }

  // 初期化用
  factory Station.createEmpty() {
    return const Station(
      stationCode: StationCode.empty,
      name: "",
      centerPosition: Offset(0, 0),
      color: CustomColor.midosujiLineColor,
      width: 0,
      height: 0,
      borderRadius: 0,
      trainLineList: [],
      shortNameList: [],
    );
  }

  // widget配置用の位置
  Offset getPosition() {
    double top = centerPosition.dy - height / 2;
    double left = centerPosition.dx - width / 2;
    return Offset(left, top);
  }

  // 駅の選択状態をセット
  Station setIsSelected(bool isSelected) {
    return copyWith(
      isSelected: isSelected,
    );
  }

  // 解答の判定
  bool answer(String answerName) {
    return name == answerName;
  }

  // 解答済みにする
  Station setAnswerd() {
    return copyWith(isAnswred: true);
  }
}
