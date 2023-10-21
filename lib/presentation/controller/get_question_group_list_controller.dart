import 'package:interactive_viewer_01/application/input_boundary/i_get_question_group_list_use_case.dart';

class GetQuestionGroupListController {
  GetQuestionGroupListController({
    required this.useCase,
  });

  final IGetQuestionGroupListUseCase useCase;

  handle() async {
    useCase.handle();
  }
}
