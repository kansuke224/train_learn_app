import 'package:interactive_viewer_01/application/enum/question_group_code.dart';
import 'package:interactive_viewer_01/constants/station_info.dart';
import 'package:interactive_viewer_01/constants/train_line_info.dart';
import 'package:interactive_viewer_01/domain/model/answer.dart';
import 'package:interactive_viewer_01/domain/model/answer_score.dart';
import 'package:interactive_viewer_01/domain/model/question.dart';
import 'package:interactive_viewer_01/domain/model/question_group.dart';
import 'package:interactive_viewer_01/domain/model/station.dart';

// 一旦マスタ情報はファイルで保持する
final List<QuestionGroup> questionGroupListMaster = [
  QuestionGroup(
    questionGroupCode: QuestionGroupCode.midosujiLine.name,
    questionGroupName: "大阪メトロ 御堂筋線",
    answerScore: const AnswerScore(
      score: 0,
    ),
    trainLineList: [
      midosujiLine,
    ],
    questionList: midosujiStationMaster.map((value) {
      return Question(
        questionCode: value.questionCode,
        answer: Answer(correctAnswer: value.name),
        station: Station(
          name: value.name,
          trainLineList: value.trainLineList,
        ),
      );
    }).toList(),
  )
];
