import 'package:interactive_viewer_01/application/input_boundary/i_answer_question_use_case.dart';
import 'package:interactive_viewer_01/application/input_data/answer_question_input_data.dart';

class AnswerQuestionController {
  AnswerQuestionController({
    required this.useCase,
  });

  final IAnswerQuestionUseCase useCase;

  handle(String questionCode, String answer) async {
    AnswerQuestionInputData inputData = AnswerQuestionInputData(
      questionCode: questionCode,
      answer: answer,
    );
    useCase.handle(inputData);
  }
}
