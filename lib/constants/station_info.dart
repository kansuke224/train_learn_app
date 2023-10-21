import 'package:interactive_viewer_01/constants/train_line_info.dart';
import 'package:interactive_viewer_01/application/enum/question_code.dart';
import 'package:interactive_viewer_01/domain/model/train_line.dart';

// TODO: fix
class StationMaster {
  const StationMaster({
    required this.questionCode,
    required this.name,
    required this.trainLineList,
  });

  final String questionCode;
  final String name;
  final List<({TrainLine trainLine, String stationShortName})> trainLineList;
}

enum StationButtonType {
  circle,
  square,
}

List<StationMaster> midosujiStationMaster = [
  StationMaster(
    questionCode: QuestionCode.esaka.name,
    name: "江坂",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M11")],
  ),
  StationMaster(
    questionCode: QuestionCode.higashimikuni.name,
    name: "東三国",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M12")],
  ),
  StationMaster(
    questionCode: QuestionCode.shinOsaka.name,
    name: "新大阪",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M13")],
  ),
  StationMaster(
    questionCode: QuestionCode.nishinakajimaMinamigata.name,
    name: "西中島南方",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M14")],
  ),
  StationMaster(
    questionCode: QuestionCode.nakatsu.name,
    name: "中津",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M15")],
  ),
  StationMaster(
    questionCode: QuestionCode.umeda.name,
    name: "梅田",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M16")],
  ),
  StationMaster(
    questionCode: QuestionCode.yodoyabashi.name,
    name: "淀屋橋",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M17")],
  ),
  StationMaster(
    questionCode: QuestionCode.hommachi.name,
    name: "本町",
    trainLineList: [
      (trainLine: midosujiLine, stationShortName: "M17"),
      (trainLine: chuoLine, stationShortName: "C16"),
      (trainLine: yotsubashiLine, stationShortName: "Y13"),
    ],
  ),
  StationMaster(
    questionCode: QuestionCode.shinsaibashi.name,
    name: "心斎橋",
    trainLineList: [
      (trainLine: midosujiLine, stationShortName: "M19"),
      (trainLine: nagahoriTsurumiRyokuchiLine, stationShortName: "N15"),
    ],
  ),
  StationMaster(
    questionCode: QuestionCode.namba.name,
    name: "なんば",
    trainLineList: [
      (trainLine: midosujiLine, stationShortName: "M20"),
      (trainLine: sennichimaeLine, stationShortName: "S16"),
      (trainLine: yotsubashiLine, stationShortName: "Y15"),
    ],
  ),
  StationMaster(
    questionCode: QuestionCode.daikokucho.name,
    name: "大国町",
    trainLineList: [
      (trainLine: midosujiLine, stationShortName: "M21"),
      (trainLine: yotsubashiLine, stationShortName: "Y16"),
    ],
  ),
  StationMaster(
    questionCode: QuestionCode.dobutsuenMae.name,
    name: "動物園前",
    trainLineList: [
      (trainLine: midosujiLine, stationShortName: "M22"),
      (trainLine: sakaisujiLine, stationShortName: "K19"),
    ],
  ),
  StationMaster(
    questionCode: QuestionCode.tennoji.name,
    name: "天王寺",
    trainLineList: [
      (trainLine: midosujiLine, stationShortName: "M23"),
      (trainLine: tanimachiLine, stationShortName: "T27"),
    ],
  ),
  StationMaster(
    questionCode: QuestionCode.showacho.name,
    name: "昭和町",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M24")],
  ),
  StationMaster(
    questionCode: QuestionCode.nishitanabe.name,
    name: "西田辺",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M25")],
  ),
  StationMaster(
    questionCode: QuestionCode.nagai.name,
    name: "長居",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M26")],
  ),
  StationMaster(
    questionCode: QuestionCode.abiko.name,
    name: "あびこ",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M27")],
  ),
  StationMaster(
    questionCode: QuestionCode.kitahanada.name,
    name: "北花田",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M28")],
  ),
  StationMaster(
    questionCode: QuestionCode.shinkanaoka.name,
    name: "新金岡",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M29")],
  ),
  StationMaster(
    questionCode: QuestionCode.nakamozu.name,
    name: "なかもず",
    trainLineList: [(trainLine: midosujiLine, stationShortName: "M30")],
  ),
];
