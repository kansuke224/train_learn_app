import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interactive_viewer_01/model/station_question.dart';
import 'package:interactive_viewer_01/model/train_line.dart';
import 'package:interactive_viewer_01/question/model/answer_score.dart';
import 'package:interactive_viewer_01/question/model/question.dart';
import 'package:interactive_viewer_01/question/model/question_group.dart';

part 'station_question_group.freezed.dart';

@freezed
class StationQuestionGroup with _$StationQuestionGroup implements QuestionGroup {
  const StationQuestionGroup._();

  const factory StationQuestionGroup({
    required String questionGroupCode,
    required String questionGroupName,
    required Map<QuestionCode, StationQuestion> questionMap,
    required AnswerScore answerScore,
    required List<TrainLine> trainLineList,
  }) = _StationQuestionGroup;

  @override
  StationQuestionGroup countAnswerScore() {
    return copyWith(
      answerScore: answerScore.countThisAnswer(
        questionMap.values.toList(),
      ),
    );
  }

  @override
  Future<StationQuestionGroup> getBestScore() async {
    return copyWith(
      answerScore: await answerScore.getBestScore(),
    );
  }

  // TODO: 本来であれば、QuestionGroup側で管理したいメソッド
  @override
  StationQuestionGroup setAnswerToQuestion(QuestionCode questionCode, String actualAnswer) {
    StationQuestion newQuestion = questionMap[questionCode]!.setAnswer(actualAnswer);
    Map<QuestionCode, StationQuestion> newMap = {...questionMap};
    newMap[questionCode] = newQuestion;

    // questionMapを更新して返す
    return copyWith(
      questionMap: newMap,
    );
  }

  // TODO: 本来であれば、QuestionGroup側で管理したいメソッド
  bool isAnswerFinished() {
    // 解答済みのstationQuestionを検索
    List<StationQuestion> answerdList = questionMap.values
        .where(
          (stationQuestion) => stationQuestion.answer.answerResult != null,
        )
        .toList();
    // 全体の問題数
    int allQuestionCount = questionMap.length;
    // 解答済みの問題数
    int answerdQuestionCount = answerdList.length;
    return allQuestionCount == answerdQuestionCount;
  }
}
