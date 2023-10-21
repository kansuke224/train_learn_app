import 'package:interactive_viewer_01/application/output_boundary/i_get_question_group_list_presenter.dart';
import 'package:interactive_viewer_01/application/output_data/get_question_group_list_output_data.dart';
import 'package:interactive_viewer_01/presentation/view_changer/i_get_question_group_list_view_changer.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_group_list_view_model.dart';

class GetQuestionGroupListPresenter implements IGetQuestionGroupListPresenter {
  GetQuestionGroupListPresenter({
    required this.viewChanger,
  });

  final IGetQuestionGroupListViewChanger viewChanger;

  @override
  complete(List<GetQuestionGroupListOutputData> outputDataList) {
    // ViewModelへ詰め替える
    List<GetQuestionGroupListViewModel> viewModelList = outputDataList.map((e) {
      return GetQuestionGroupListViewModel(
        questionGroupCode: e.questionGroupCode,
        questionName: e.questionName,
        bestScoreText: "自己ベスト : ${e.questionNum}問中 ${e.bestScore}問 正解",
      );
    }).toList();
    // ViewChangerへ処理を渡す
    viewChanger.change(viewModelList);
  }
}
