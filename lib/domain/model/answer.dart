class Answer {
  Answer({
    required this.correctAnswer,
    this.actualAnswer,
    this.answerResult,
  });

  // 正しい解答
  final String correctAnswer;
  // 実際の解答
  late String? actualAnswer;
  // 解答結果
  late bool? answerResult;

  Answer answer(String actualAnswer) {
    // 解答結果を判定
    bool answerResult = correctAnswer == actualAnswer;
    // 実際の解答・解答結果をセットしたAnswerを返す
    return Answer(
      correctAnswer: correctAnswer,
      actualAnswer: actualAnswer,
      answerResult: answerResult,
    );
  }
}

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'answer.freezed.dart';

// @freezed
// class Answer with _$Answer {
//   const Answer._();

//   const factory Answer({
//     // 正しい解答
//     required String correctAnswer,
//     // 実際の解答
//     String? actualAnswer,
//     // 解答結果
//     bool? answerResult,
//   }) = _Answer;

//   answer(String actualAnswer) {
//     // 解答結果を判定
//     bool answerResult = correctAnswer == actualAnswer;
//     // 実際の解答・解答結果をセットしたAnswerを返す
//     return copyWith(
//       actualAnswer: actualAnswer,
//       answerResult: answerResult,
//     );
//   }
// }
