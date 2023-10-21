// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:interactive_viewer_01/question/enum/question_group_code.dart';
// import 'package:interactive_viewer_01/question/model/question.dart';

// part 'question_group.freezed.dart';

// @freezed
// class QuestionGroup with _$QuestionGroup {
//   const QuestionGroup._();
//   const factory QuestionGroup({
//     required QuestionGroupCode questionGroupCode,
//     required String questionGroupName,
//     required List<Question> questionList,
//   }) = _QuestionGroup;
// }

import 'package:interactive_viewer_01/question/model/answer_score.dart';
import 'package:interactive_viewer_01/question/model/question.dart';

typedef QuestionCode = String;

abstract class QuestionGroup {
  QuestionGroup({
    required this.questionGroupCode,
    required this.questionGroupName,
    required this.questionMap,
    required this.answerScore,
  });

  final String questionGroupCode;
  final String questionGroupName;
  final Map<QuestionCode, Question> questionMap;
  final AnswerScore answerScore;

  QuestionGroup countAnswerScore();

  Future<QuestionGroup> getBestScore();

  QuestionGroup setAnswerToQuestion(QuestionCode questionCode, String actualAnswer);
}
