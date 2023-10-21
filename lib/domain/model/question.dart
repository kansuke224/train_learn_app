import 'package:interactive_viewer_01/domain/model/answer.dart';
import 'package:interactive_viewer_01/domain/model/station.dart';

class Question {
  const Question({
    required this.questionCode,
    required this.answer,
    required this.station,
  });

  final String questionCode;
  final Answer answer;
  final Station station;

  Question setAnswer(String actualAnswer) {
    Answer answer = this.answer.answer(actualAnswer);
    return Question(
      questionCode: questionCode,
      answer: answer,
      station: station,
    );
  }
}
