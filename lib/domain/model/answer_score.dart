import 'package:flutter/material.dart';
import 'package:interactive_viewer_01/domain/model/question.dart';

@immutable
class AnswerScore {
  const AnswerScore({
    required this.score,
    this.bestScore = 0,
  });

  // 正当数
  final int score;
  // ベスト正当数
  final int bestScore;

  // ベスト正当数をセットする
  AnswerScore setBestScore(int newBestScore) {
    return AnswerScore(
      score: score,
      bestScore: newBestScore,
    );
  }

  // 正当数を計算する
  AnswerScore countThisAnswer(List<Question> questionList) {
    int newScore = 0;
    int newBestScore = bestScore;
    // 問題ごとに解答結果を確認して、正当数を計算する
    for (var question in questionList) {
      bool answerResult = question.answer.answerResult ?? false;
      if (answerResult) {
        newScore++;
      }
    }
    // ベスト正当数を超えているか確認し、超えている場合はベスト正当数を更新
    if (newScore > bestScore) {
      newBestScore = newScore;
    }
    // 正当数・ベスト正当数を更新したAnswerScoreを返す
    return AnswerScore(
      score: newScore,
      bestScore: newBestScore,
    );
  }
}

// @freezed
// class AnswerScore with _$AnswerScore {
//   const AnswerScore._();

//   const factory AnswerScore({
//     // 正当数
//     required int thisScore,
//     // ベスト正当数
//     required int bestScore,
//     // questionGroupCode
//     required String questionGroupCode,
//   }) = _AnswerScore;

//   factory AnswerScore.init(String questionGroupCode) {
//     return AnswerScore(
//       thisScore: 0,
//       bestScore: 0,
//       questionGroupCode: questionGroupCode,
//     );
//   }

//   // 正当数を計算する
//   AnswerScore countThisAnswer(List<Question> questionList) {
//     int newScore = 0;
//     int newBestScore = bestScore;
//     // 問題ごとに解答結果を確認して、正当数を計算する
//     for (var question in questionList) {
//       bool answerResult = question.answer.answerResult ?? false;
//       if (answerResult) {
//         newScore++;
//       }
//     }
//     // ベスト正当数を超えているか確認し、超えている場合はベスト正当数を更新
//     if (newScore > bestScore) {
//       newBestScore = newScore;
//       _updateBestScore(newBestScore);
//     }
//     // 正当数・ベスト正当数を更新したAnswerScoreを返す
//     return copyWith(
//       thisScore: newScore,
//       bestScore: newBestScore,
//     );
//   }

//   // ベスト正当数を取得する
//   Future<AnswerScore> getBestScore() async {
//     int storedBestScore = await BestScoreRepotiory().fetchBestAnswerScore(questionGroupCode);
//     return copyWith(
//       bestScore: storedBestScore,
//     );
//   }

//   // ベスト正当数を更新する
//   Future<void> _updateBestScore(int newBestScore) async {
//     BestScoreRepotiory().storeBestAnswerScore(questionGroupCode, newBestScore);
//   }
// }
