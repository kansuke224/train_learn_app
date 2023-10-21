import 'package:interactive_viewer_01/application/enum/question_code.dart';
import 'package:interactive_viewer_01/domain/model/answer_score.dart';
import 'package:interactive_viewer_01/domain/model/question.dart';
import 'package:interactive_viewer_01/domain/model/train_line.dart';

class QuestionGroup {
  QuestionGroup({
    required this.questionGroupCode,
    required this.questionGroupName,
    required this.questionList,
    required this.answerScore,
    required this.trainLineList,
  });

  final String questionGroupCode;
  final String questionGroupName;
  final List<Question> questionList;
  final AnswerScore answerScore;
  final List<TrainLine> trainLineList;

  bool getIsAnswerFinished() {
    // 解答済みのQuestionを検索
    List<Question> answeredList = questionList
        .where(
          (stationQuestion) => stationQuestion.answer.answerResult != null,
        )
        .toList();
    // 全体の問題数
    int allQuestionCount = questionList.length;
    // 解答済みの問題数
    int answeredQuestionCount = answeredList.length;
    return allQuestionCount == answeredQuestionCount;
  }

  QuestionGroup setBestScore(int bestScore) {
    return QuestionGroup(
      questionGroupCode: questionGroupCode,
      questionGroupName: questionGroupName,
      questionList: questionList,
      answerScore: answerScore.setBestScore(bestScore),
      trainLineList: trainLineList,
    );
  }

  QuestionGroup setAnswerToQuestion(QuestionCode questionCode, String actualAnswer) {
    Question question = questionList.firstWhere(
      (question) => question.questionCode == questionCode,
    );
    int index = questionList.indexOf(question);
    Question newQuestion = question.setAnswer(actualAnswer);
    List<Question> newQuestionList = [...questionList];
    newQuestionList[index] = newQuestion;

    // questionListを更新して返す
    return QuestionGroup(
      questionGroupCode: questionGroupCode,
      questionGroupName: questionGroupName,
      questionList: newQuestionList,
      answerScore: answerScore,
      trainLineList: trainLineList,
    );
  }

  QuestionGroup countAnswerScore() {
    return QuestionGroup(
      questionGroupCode: questionGroupCode,
      questionGroupName: questionGroupName,
      questionList: questionList,
      answerScore: answerScore.countThisAnswer(
        questionList,
      ),
      trainLineList: trainLineList,
    );
  }
}
