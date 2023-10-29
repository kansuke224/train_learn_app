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
    centerPosition: const Offset(1236, 1088),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.nishinakajimaMinamigata.name: StationButtonStyle.circle(
    centerPosition: const Offset(1236, 1128),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.nakatsu.name: StationButtonStyle.circle(
    centerPosition: const Offset(1231, 1221),
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
    centerPosition: const Offset(1246, 1442),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.namba.name: StationButtonStyle.square(
    centerPosition: const Offset(1233, 1495),
    color: CustomColor.midosujiLineColor,
    width: 45,
  ),
  QuestionCode.daikokucho.name: StationButtonStyle.square(
    centerPosition: const Offset(1226, 1554),
    color: CustomColor.midosujiLineColor,
    width: 30,
  ),
  QuestionCode.dobutsuenMae.name: StationButtonStyle.circle(
    centerPosition: const Offset(1256, 1599),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.tennoji.name: StationButtonStyle.circle(
    centerPosition: const Offset(1302, 1613),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.showacho.name: StationButtonStyle.circle(
    centerPosition: const Offset(1324, 1711),
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
    centerPosition: const Offset(1319, 2087),
    color: CustomColor.midosujiLineColor,
  ),
  QuestionCode.nakamozu.name: StationButtonStyle.circle(
    centerPosition: const Offset(1271, 2159),
    color: CustomColor.midosujiLineColor,
  ),
  // 谷町線
  QuestionCode.dainichi.name: StationButtonStyle.circle(
    centerPosition: const Offset(1621, 1005),
    color: CustomColor.tanimachiLineColor,
  ),
  // 四つ橋線
  QuestionCode.nishiUmeda.name: StationButtonStyle.circle(
    centerPosition: const Offset(1216, 1290),
    color: CustomColor.yotsubashiLineColor,
  ),
  QuestionCode.higobashi.name: StationButtonStyle.circle(
    centerPosition: const Offset(1222, 1349),
    color: CustomColor.yotsubashiLineColor,
  ),
  QuestionCode.hommachiY.name: StationButtonStyle.square(
    centerPosition: const Offset(1234, 1417),
    color: CustomColor.yotsubashiLineColor,
    width: 45,
  ),
  QuestionCode.yotsubashi.name: StationButtonStyle.circle(
    centerPosition: const Offset(1222, 1452),
    color: CustomColor.yotsubashiLineColor,
  ),
  QuestionCode.nambaY.name: StationButtonStyle.square(
    centerPosition: const Offset(1233, 1495),
    color: CustomColor.yotsubashiLineColor,
    width: 45,
  ),
  QuestionCode.daikokuchoY.name: StationButtonStyle.square(
    centerPosition: const Offset(1225, 1554),
    color: CustomColor.yotsubashiLineColor,
    width: 30,
  ),
  QuestionCode.hanazonocho.name: StationButtonStyle.circle(
    centerPosition: const Offset(1215, 1624),
    color: CustomColor.yotsubashiLineColor,
  ),
  QuestionCode.kishinosato.name: StationButtonStyle.circle(
    centerPosition: const Offset(1205, 1678),
    color: CustomColor.yotsubashiLineColor,
  ),
  QuestionCode.tamade.name: StationButtonStyle.circle(
    centerPosition: const Offset(1193, 1743),
    color: CustomColor.yotsubashiLineColor,
  ),
  QuestionCode.kitakagaya.name: StationButtonStyle.circle(
    centerPosition: const Offset(1137, 1764),
    color: CustomColor.yotsubashiLineColor,
  ),
  QuestionCode.suminoekoen.name: StationButtonStyle.circle(
    centerPosition: const Offset(1105, 1848),
    color: CustomColor.yotsubashiLineColor,
  ),
  // 中央線
  QuestionCode.cosmosquare.name: StationButtonStyle.circle(
    centerPosition: const Offset(808, 1661),
    color: CustomColor.chuoLineColor,
  ),
  // 千日前線
  QuestionCode.nodahanshin.name: StationButtonStyle.circle(
    centerPosition: const Offset(1114, 1327),
    color: CustomColor.sennichimaeLineColor,
  ),
  // 堺筋線
  QuestionCode.tenjimbashisuji6Chome.name: StationButtonStyle.circle(
    centerPosition: const Offset(1292, 1234),
    color: CustomColor.sakaisujiLineColor,
  ),
  // 長堀鶴見緑地線
  QuestionCode.taisho.name: StationButtonStyle.circle(
    centerPosition: const Offset(1140, 1498),
    color: CustomColor.nagahoriTsurumiRyokuchiLineColor,
  ),
  // 今里筋線
  QuestionCode.itakano.name: StationButtonStyle.circle(
    centerPosition: const Offset(1471, 932),
    color: CustomColor.imazatosujiLineColor,
  ),
};
