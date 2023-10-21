import 'package:interactive_viewer_01/application/input_boundary/i_get_question_list_use_case.dart';
import 'package:interactive_viewer_01/application/input_data/get_question_list_input_data.dart';

class GetQuestionListController {
  GetQuestionListController({
    required this.useCase,
  });

  final IGetQuestionListUseCase useCase;

  handle(String questionGroupCode) async {
    GetQuestionListInputData inputData = GetQuestionListInputData(
      questionGroupCode: questionGroupCode,
    );
    useCase.handle(inputData);
  }
}
