import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_button_style_info.freezed.dart';

@freezed
class StationButtonStyleInfo with _$StationButtonStyleInfo {
  const StationButtonStyleInfo._();

  const factory StationButtonStyleInfo({
    required Color color,
    required Offset centerPosition,
    required Offset leftTopPosition,
    required double width,
    required double height,
    required double borderRadius,
  }) = _StationButtonStyleInfo;

  // 円形の駅
  factory StationButtonStyleInfo.circle({
    required color,
    required centerPosition,
  }) {
    double width = 20;
    double height = 20;
    Offset leftTopPosition = Offset(
      centerPosition.dx - width / 2,
      centerPosition.dy - height / 2,
    );
    return StationButtonStyleInfo(
      color: color,
      centerPosition: centerPosition,
      leftTopPosition: leftTopPosition,
      width: width,
      height: height,
      borderRadius: 10,
    );
  }

  // 四角形の駅(複数の路線が通っている駅に利用する)
  factory StationButtonStyleInfo.square({
    required color,
    required centerPosition,
    required width,
  }) {
    double height = 20;
    Offset leftTopPosition = Offset(
      centerPosition.dx - width / 2,
      centerPosition.dy - height / 2,
    );
    return StationButtonStyleInfo(
      color: color,
      centerPosition: centerPosition,
      leftTopPosition: leftTopPosition,
      width: width,
      height: height,
      borderRadius: 10,
    );
  }
}
