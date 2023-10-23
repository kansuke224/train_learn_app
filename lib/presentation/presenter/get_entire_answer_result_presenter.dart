import 'package:interactive_viewer_01/application/output_boundary/i_get_entire_answer_result_presenter.dart';
import 'package:interactive_viewer_01/application/output_data/get_entire_answer_result_output_data.dart';
import 'package:interactive_viewer_01/presentation/view_changer/i_get_entire_answer_result_view_changer.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_entire_answer_result_view_model.dart';

class GetEntireAnswerResultPresenter implements IGetEntireAnswerResultPresenter {
  GetEntireAnswerResultPresenter({
    required this.viewChanger,
  });

  final IGetEntireAnswerResultViewChanger viewChanger;

  @override
  complete(GetEntireAnswerResultOutputData outputData) {
    // viewModelへ詰め替える
    final viewModel = GetEntireAnswerResultViewModel(
      answerScoreText: "${outputData.answerNum}問中 ${outputData.answerScore}問 正解",
      answerResultList: outputData.answerResultList,
    );
    // viewChangerへ処理を投げる
    viewChanger.change(viewModel);
  }
}
