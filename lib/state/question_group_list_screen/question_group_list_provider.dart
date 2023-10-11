import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/constant/station_info.dart';
import 'package:interactive_viewer_01/model/station.dart';
import 'package:interactive_viewer_01/model/station_button_style_info.dart';
import 'package:interactive_viewer_01/model/station_question.dart';
import 'package:interactive_viewer_01/model/station_question_group.dart';
import 'package:interactive_viewer_01/model/train_line.dart';
import 'package:interactive_viewer_01/question/model/answer.dart';
import 'package:interactive_viewer_01/question/model/answer_score.dart';
import 'package:interactive_viewer_01/style/custom_color.dart';

final questionGroupListProvider = FutureProvider<List<StationQuestionGroup>>((ref) async {
  return Future.wait(
    stationQuestionGroupList
        .map(
          (stationQuestionGroup) => stationQuestionGroup.getBestScore(),
        )
        .toList(),
  );
});

final List<StationQuestionGroup> stationQuestionGroupList = [
  StationQuestionGroup(
    questionGroupCode: "midosujiLine",
    questionGroupName: "大阪メトロ 御堂筋線",
    answerScore: AnswerScore.init("midosujiLine"),
    trainLineList: [
      TrainLine.createMidosujiLine(),
    ],
    // questionMap: {
    //   "esaka": StationQuestion(
    //     answer: Answer(correctAnswer: midosujiStationMaster["esaka"]!.name),
    //     station: Station(
    //       name: midosujiStationMaster["esaka"]!.name,
    //       trainLineList: midosujiStationMaster["esaka"]!.trainLineList,
    //       shortNameList: midosujiStationMaster["esaka"]!.shortNameList,
    //     ),
    //     stationButtonStyleInfo: StationButtonStyleInfo.circle(
    //       color: midosujiStationMaster["esaka"]!.color,
    //       centerPosition: midosujiStationMaster["esaka"]!.centerPosition,
    //     ),
    //   ),
    // },
    questionMap: Map.fromIterables(
      midosujiStationMaster.entries.map((e) => e.key).toList(),
      midosujiStationMaster.entries.map((e) {
        return StationQuestion(
          answer: Answer(correctAnswer: e.value.name),
          station: Station(
            name: e.value.name,
            trainLineList: e.value.trainLineList,
            shortNameList: e.value.shortNameList,
          ),
          stationButtonStyleInfo: e.value.type == StationButtonType.circle
              ? StationButtonStyleInfo.circle(
                  color: e.value.color,
                  centerPosition: e.value.centerPosition,
                )
              : StationButtonStyleInfo.square(
                  color: e.value.color,
                  centerPosition: e.value.centerPosition,
                  width: e.value.width,
                ),
        );
      }).toList(),
    ),
  ),
];
