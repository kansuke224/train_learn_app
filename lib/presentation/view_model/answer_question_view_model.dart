import 'package:interactive_viewer_01/presentation/enum/answer_result.dart';

class AnswerQuestionViewModel {
  AnswerQuestionViewModel({
    required this.questionCode,
    required this.answerResult,
    required this.isAllAnswerFinished,
  });

  final String questionCode;
  final AnswerResult answerResult;
  final bool isAllAnswerFinished;
}
