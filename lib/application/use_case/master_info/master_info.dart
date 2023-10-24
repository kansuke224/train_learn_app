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
  ),
  // QuestionGroup(
  //   questionGroupCode: QuestionGroupCode.tanimachiLine.name,
  //   questionGroupName: "大阪メトロ 谷町線",
  //   answerScore: const AnswerScore(
  //     score: 0,
  //   ),
  //   trainLineList: [
  //     tanimachiLine,
  //   ],
  //   questionList: tanimachiStationMaster.map((value) {
  //     return Question(
  //       questionCode: value.questionCode,
  //       answer: Answer(correctAnswer: value.name),
  //       station: Station(
  //         name: value.name,
  //         trainLineList: value.trainLineList,
  //       ),
  //     );
  //   }).toList(),
  // ),
  QuestionGroup(
    questionGroupCode: QuestionGroupCode.yotsubashiLine.name,
    questionGroupName: "大阪メトロ 四つ橋線",
    answerScore: const AnswerScore(
      score: 0,
    ),
    trainLineList: [
      yotsubashiLine,
    ],
    questionList: yotsubashiStationMaster.map((value) {
      return Question(
        questionCode: value.questionCode,
        answer: Answer(correctAnswer: value.name),
        station: Station(
          name: value.name,
          trainLineList: value.trainLineList,
        ),
      );
    }).toList(),
  ),
  // QuestionGroup(
  //   questionGroupCode: QuestionGroupCode.chuoLine.name,
  //   questionGroupName: "大阪メトロ 中央線",
  //   answerScore: const AnswerScore(
  //     score: 0,
  //   ),
  //   trainLineList: [
  //     chuoLine,
  //   ],
  //   questionList: chuoStationMaster.map((value) {
  //     return Question(
  //       questionCode: value.questionCode,
  //       answer: Answer(correctAnswer: value.name),
  //       station: Station(
  //         name: value.name,
  //         trainLineList: value.trainLineList,
  //       ),
  //     );
  //   }).toList(),
  // ),
  // QuestionGroup(
  //   questionGroupCode: QuestionGroupCode.sennichimaeLine.name,
  //   questionGroupName: "大阪メトロ 千日前線",
  //   answerScore: const AnswerScore(
  //     score: 0,
  //   ),
  //   trainLineList: [
  //     sennichimaeLine,
  //   ],
  //   questionList: sennichimaeStationMaster.map((value) {
  //     return Question(
  //       questionCode: value.questionCode,
  //       answer: Answer(correctAnswer: value.name),
  //       station: Station(
  //         name: value.name,
  //         trainLineList: value.trainLineList,
  //       ),
  //     );
  //   }).toList(),
  // ),
  // QuestionGroup(
  //   questionGroupCode: QuestionGroupCode.sakaisujiLine.name,
  //   questionGroupName: "大阪メトロ 堺筋線",
  //   answerScore: const AnswerScore(
  //     score: 0,
  //   ),
  //   trainLineList: [
  //     sakaisujiLine,
  //   ],
  //   questionList: sakaisujiStationMaster.map((value) {
  //     return Question(
  //       questionCode: value.questionCode,
  //       answer: Answer(correctAnswer: value.name),
  //       station: Station(
  //         name: value.name,
  //         trainLineList: value.trainLineList,
  //       ),
  //     );
  //   }).toList(),
  // ),
  // QuestionGroup(
  //   questionGroupCode: QuestionGroupCode.nagahoriTsurumiRyokuchiLine.name,
  //   questionGroupName: "大阪メトロ 長堀鶴見緑地線",
  //   answerScore: const AnswerScore(
  //     score: 0,
  //   ),
  //   trainLineList: [
  //     nagahoriTsurumiRyokuchiLine,
  //   ],
  //   questionList: nagahoriTsurumiRyokuchiStationMaster.map((value) {
  //     return Question(
  //       questionCode: value.questionCode,
  //       answer: Answer(correctAnswer: value.name),
  //       station: Station(
  //         name: value.name,
  //         trainLineList: value.trainLineList,
  //       ),
  //     );
  //   }).toList(),
  // ),
  // QuestionGroup(
  //   questionGroupCode: QuestionGroupCode.imazatosujiLine.name,
  //   questionGroupName: "大阪メトロ 今里筋線",
  //   answerScore: const AnswerScore(
  //     score: 0,
  //   ),
  //   trainLineList: [
  //     imazatosujiLine,
  //   ],
  //   questionList: imazatosujiStationMaster.map((value) {
  //     return Question(
  //       questionCode: value.questionCode,
  //       answer: Answer(correctAnswer: value.name),
  //       station: Station(
  //         name: value.name,
  //         trainLineList: value.trainLineList,
  //       ),
  //     );
  //   }).toList(),
  // ),
];
