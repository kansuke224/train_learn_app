import 'package:interactive_viewer_01/application/input_boundary/i_get_entire_answer_result_use_case.dart';

class GetEntireAnswerResultController {
  GetEntireAnswerResultController({
    required this.useCase,
  });

  final IGetEntireAnswerResultUseCase useCase;

  handle() async {
    useCase.handle();
  }
}
