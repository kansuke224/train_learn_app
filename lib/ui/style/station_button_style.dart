import 'dart:ui';

import 'package:interactive_viewer_01/application/enum/question_code.dart';
import 'package:interactive_viewer_01/ui/style/custom_color.dart';

enum StationButtonType {
  circle,
  square,
}

// 駅ボタンのスタイル情報
class StationButtonStyle {
  const StationButtonStyle({
    required this.centerPosition,
    required this.color,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  final Offset centerPosition;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;

  // 円形の駅
  factory StationButtonStyle.circle({
    required centerPosition,
    required color,
  }) {
    double width = 20;
    double height = 20;
    return StationButtonStyle(
      centerPosition: centerPosition,
      color: color,
      width: width,
      height: height,
      borderRadius: width / 2,
    );
  }

  // 四角形の駅(複数の路線が通っている駅に利用する)
  factory StationButtonStyle.square({
    required color,
    required centerPosition,
    required double width,
  }) {
    double height = 20;
    return StationButtonStyle(
      centerPosition: centerPosition,
      color: color,
      width: width,
      height: height,
      borderRadius: 10,
    );
  }

  Offset get leftTopPosition => Offset(
        centerPosition.dx - width / 2,
        centerPosition.dy - height / 2,
      );
}

// 問題コードに対して、駅ボタンのスタイル情報を登録する
Map<String, StationButtonStyle> stationButtonStyleMap = {
  QuestionCode.esaka.name: StationButtonStyle.circle(
    centerPosition: const Offset(1229, 935),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.higashimikuni.name: StationButtonStyle.circle(
    centerPosition: const Offset(1236, 1049),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.shinOsaka.name: StationButtonStyle.circle(
    centerPosition: const Offset(1235, 1088),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.nishinakajimaMinamigata.name: StationButtonStyle.circle(
    centerPosition: const Offset(1235, 1128),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.nakatsu.name: StationButtonStyle.circle(
    centerPosition: const Offset(1230, 1221),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.umeda.name: StationButtonStyle.circle(
    centerPosition: const Offset(1228, 1262),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.yodoyabashi.name: StationButtonStyle.circle(
    centerPosition: const Offset(1248, 1343),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.hommachi.name: StationButtonStyle.square(
    centerPosition: const Offset(1234, 1417),
    color: CustomColor.midosujiLineColor,
    width: 45,
  ),
  QuestionCode.shinsaibashi.name: StationButtonStyle.circle(
    centerPosition: const Offset(1245, 1442),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.namba.name: StationButtonStyle.square(
    centerPosition: const Offset(1233, 1495),
    color: CustomColor.midosujiLineColor,
    width: 45,
  ),
  QuestionCode.daikokucho.name: StationButtonStyle.square(
    centerPosition: const Offset(1225, 1554),
    color: CustomColor.midosujiLineColor,
    width: 30,
  ),
  QuestionCode.dobutsuenMae.name: StationButtonStyle.circle(
    centerPosition: const Offset(1256, 1598),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.tennoji.name: StationButtonStyle.circle(
    centerPosition: const Offset(1302, 1612),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.showacho.name: StationButtonStyle.circle(
    centerPosition: const Offset(1323, 1711),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.nishitanabe.name: StationButtonStyle.circle(
    centerPosition: const Offset(1318, 1770),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.nagai.name: StationButtonStyle.circle(
    centerPosition: const Offset(1311, 1836),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.abiko.name: StationButtonStyle.circle(
    centerPosition: const Offset(1306, 1901),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.kitahanada.name: StationButtonStyle.circle(
    centerPosition: const Offset(1323, 1985),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.shinkanaoka.name: StationButtonStyle.circle(
    centerPosition: const Offset(1318, 2087),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.nakamozu.name: StationButtonStyle.circle(
    centerPosition: const Offset(1271, 2159),
    color: CustomColor.midosujiLineColor,
  ),
};
