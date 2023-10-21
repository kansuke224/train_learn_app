import 'dart:ui';

import 'package:interactive_viewer_01/constant/train_line_info.dart';
import 'package:interactive_viewer_01/model/train_line.dart';
import 'package:interactive_viewer_01/style/custom_color.dart';

class StationMaster {
  const StationMaster({
    required this.name,
    required this.trainLineList,
    required this.shortNameList,
    required this.centerPosition,
    required this.color,
    this.type = StationButtonType.circle,
    this.width = 0,
  });
  final String name;
  final List<TrainLine> trainLineList;
  final List<String> shortNameList;
  final Offset centerPosition;
  final Color color;
  final StationButtonType type;
  final double width;
}

enum StationButtonType {
  circle,
  square,
}

const Map<String, StationMaster> midosujiStationMaster = {
  "esaka": StationMaster(
    name: "江坂",
    trainLineList: [midosujiLine],
    shortNameList: ["M11"],
    centerPosition: Offset(1229, 935),
    color: CustomColor.midosujiLineColor,
  ),
  "higashimikuni": StationMaster(
    name: "東三国",
    trainLineList: [midosujiLine],
    shortNameList: ["M12"],
    centerPosition: Offset(1236, 1049),
    color: CustomColor.midosujiLineColor,
  ),
  "shinOsaka": StationMaster(
    name: "新大阪",
    trainLineList: [midosujiLine],
    shortNameList: ["M13"],
    centerPosition: Offset(1235, 1088),
    color: CustomColor.midosujiLineColor,
  ),
  "nishinakajimaMinamigata": StationMaster(
    name: "西中島南方",
    trainLineList: [midosujiLine],
    shortNameList: ["M14"],
    centerPosition: Offset(1235, 1128),
    color: CustomColor.midosujiLineColor,
  ),
  "nakatsu": StationMaster(
    name: "中津",
    trainLineList: [midosujiLine],
    shortNameList: ["M15"],
    centerPosition: Offset(1230, 1221),
    color: CustomColor.midosujiLineColor,
  ),
  "umeda": StationMaster(
    name: "梅田",
    trainLineList: [midosujiLine],
    shortNameList: ["M16"],
    centerPosition: Offset(1228, 1262),
    color: CustomColor.midosujiLineColor,
  ),
  "yodoyabashi": StationMaster(
    name: "淀屋橋",
    trainLineList: [midosujiLine],
    shortNameList: ["M17"],
    centerPosition: Offset(1248, 1343),
    color: CustomColor.midosujiLineColor,
  ),
  "hommachi": StationMaster(
    name: "本町",
    trainLineList: [midosujiLine, chuoLine, yotsubashiLine],
    shortNameList: ["M18", "C16", "Y13"],
    centerPosition: Offset(1234, 1417),
    color: CustomColor.midosujiLineColor,
    type: StationButtonType.square,
    width: 45,
  ),
  "shinsaibashi": StationMaster(
    name: "心斎橋",
    trainLineList: [midosujiLine, nagahoriTsurumiRyokuchiLine],
    shortNameList: ["M19", "N15"],
    centerPosition: Offset(1245, 1442),
    color: CustomColor.midosujiLineColor,
  ),
  "namba": StationMaster(
    name: "なんば",
    trainLineList: [midosujiLine, sennichimaeLine, yotsubashiLine],
    shortNameList: ["M20", "S16", "Y15"],
    centerPosition: Offset(1233, 1495),
    color: CustomColor.midosujiLineColor,
    type: StationButtonType.square,
    width: 45,
  ),
  "daikokucho": StationMaster(
    name: "大国町",
    trainLineList: [midosujiLine, yotsubashiLine],
    shortNameList: ["M21", "Y16"],
    centerPosition: Offset(1225, 1554),
    color: CustomColor.midosujiLineColor,
    type: StationButtonType.square,
    width: 30,
  ),
  "dobutsuenMae": StationMaster(
    name: "動物園前",
    trainLineList: [midosujiLine, sakaisujiLine],
    shortNameList: ["M22", "K19"],
    centerPosition: Offset(1256, 1598),
    color: CustomColor.midosujiLineColor,
  ),
  "tennoji": StationMaster(
    name: "天王寺",
    trainLineList: [midosujiLine, tanimachiLine],
    shortNameList: ["M23", "T27"],
    centerPosition: Offset(1302, 1612),
    color: CustomColor.midosujiLineColor,
  ),
  "showacho": StationMaster(
    name: "昭和町",
    trainLineList: [midosujiLine],
    shortNameList: ["M24"],
    centerPosition: Offset(1323, 1711),
    color: CustomColor.midosujiLineColor,
  ),
  "nishitanabe": StationMaster(
    name: "西田辺",
    trainLineList: [midosujiLine],
    shortNameList: ["M25"],
    centerPosition: Offset(1318, 1770),
    color: CustomColor.midosujiLineColor,
  ),
  "nagai": StationMaster(
    name: "長居",
    trainLineList: [midosujiLine],
    shortNameList: ["M26"],
    centerPosition: Offset(1311, 1836),
    color: CustomColor.midosujiLineColor,
  ),
  "abiko": StationMaster(
    name: "あびこ",
    trainLineList: [midosujiLine],
    shortNameList: ["M27"],
    centerPosition: Offset(1306, 1901),
    color: CustomColor.midosujiLineColor,
  ),
  "kitahanada": StationMaster(
    name: "北花田",
    trainLineList: [midosujiLine],
    shortNameList: ["M28"],
    centerPosition: Offset(1323, 1985),
    color: CustomColor.midosujiLineColor,
  ),
  "shinkanaoka": StationMaster(
    name: "新金岡",
    trainLineList: [midosujiLine],
    shortNameList: ["M29"],
    centerPosition: Offset(1318, 2087),
    color: CustomColor.midosujiLineColor,
  ),
  "nakamozu": StationMaster(
    name: "なかもず",
    trainLineList: [midosujiLine],
    shortNameList: ["M30"],
    centerPosition: Offset(1271, 2159),
    color: CustomColor.midosujiLineColor,
  ),
};
