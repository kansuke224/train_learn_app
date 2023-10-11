import 'package:interactive_viewer_01/question/model/answer.dart';

// part 'question.freezed.dart';

// @freezed
// class Question with _$Question {
//   const Question._();

//   const factory Question({
//     // 解答
//     required Answer answer,
//   }) = _Question;

//   setAnswer(String actualAnswer) {
//     Answer answer = this.answer.answer(actualAnswer);
//     return copyWith(
//       answer: answer,
//     );
//   }
// }

abstract class Question {
  const Question({
    required this.answer,
  });

  final Answer answer;

  Question setAnswer(String actualAnswer);
}
