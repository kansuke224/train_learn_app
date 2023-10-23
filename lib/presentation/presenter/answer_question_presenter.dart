import 'package:interactive_viewer_01/application/output_boundary/i_answer_question_presenter.dart';
import 'package:interactive_viewer_01/application/output_data/answer_question_output_data.dart';
import 'package:interactive_viewer_01/presentation/enum/answer_result.dart';
import 'package:interactive_viewer_01/presentation/view_changer/i_answer_question_view_changer.dart';
import 'package:interactive_viewer_01/presentation/view_model/answer_question_view_model.dart';

class AnswerQuestionPresenter implements IAnswerQuestionPresenter {
  AnswerQuestionPresenter({
    required this.viewChanger,
  });

  final IAnswerQuestionViewChanger viewChanger;

  @override
  complete(AnswerQuestionOutputData outputData) {
    // AnswerResultの判定
    AnswerResult answerResult = outputData.answerResult ? AnswerResult.correct : AnswerResult.unCorrect;
    // ViewModelへ詰め替える
    final viewModel = AnswerQuestionViewModel(
      questionCode: outputData.questionCode,
      answerResult: answerResult,
      isAllAnswerFinished: outputData.isAllAnswerFinished,
    );
    // ViewChangerへ処理を渡す
    viewChanger.change(viewModel);
  }
}
