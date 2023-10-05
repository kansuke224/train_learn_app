import 'dart:ui';

import 'package:interactive_viewer_01/style/custom_color.dart';

// 路線
class TrainLine {
  const TrainLine({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;

  // 御堂筋線
  factory TrainLine.createMidosujiLine() {
    return const TrainLine(
      name: "御堂筋線",
      color: CustomColor.midosujiLineColor,
    );
  }
}
