import 'package:interactive_viewer_01/application/output_boundary/i_get_question_list_presenter.dart';
import 'package:interactive_viewer_01/application/output_data/get_question_list_output_data.dart';
import 'package:interactive_viewer_01/presentation/view_changer/i_get_question_list_view_changer.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';

class GetQuestionListPresenter implements IGetQuestionListPresenter {
  GetQuestionListPresenter({
    required this.viewChanger,
  });

  final IGetQuestionListViewChanger viewChanger;

  @override
  complete(List<GetQuestionListOutputData> outputDataList) {
    // ViewModelへ詰め替える
    List<GetQuestionListViewModel> viewModelList = outputDataList.map((outputData) {
      return GetQuestionListViewModel(
        questionCode: outputData.questionCode,
        stationName: outputData.stationName,
        trainLineList: outputData.trainLineList,
      );
    }).toList();
    // ViewChangerへ処理を渡す
    viewChanger.change(viewModelList);
  }
}
