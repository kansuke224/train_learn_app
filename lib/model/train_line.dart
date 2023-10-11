import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interactive_viewer_01/style/custom_color.dart';

part 'train_line.freezed.dart';

@freezed
class TrainLine with _$TrainLine {
  const TrainLine._();

  const factory TrainLine({
    required String name,
    required Color color,
  }) = _TrainLine;

  // 御堂筋線
  factory TrainLine.createMidosujiLine() {
    return const TrainLine(
      name: "御堂筋線",
      color: CustomColor.midosujiLineColor,
    );
  }
}
