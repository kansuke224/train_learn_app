import 'package:interactive_viewer_01/application/input_boundary/i_get_question_list_use_case.dart';
import 'package:interactive_viewer_01/application/input_data/get_question_list_input_data.dart';
import 'package:interactive_viewer_01/application/output_boundary/i_get_question_list_presenter.dart';
import 'package:interactive_viewer_01/application/output_data/get_question_list_output_data.dart';
import 'package:interactive_viewer_01/application/use_case/master_info/master_info.dart';
import 'package:interactive_viewer_01/application/use_case/tmp_info/selected_question_group.dart';
import 'package:interactive_viewer_01/domain/model/question_group.dart';

class GetQuestionListUseCase implements IGetQuestionListUseCase {
  GetQuestionListUseCase({
    required this.presenter,
  });
  final IGetQuestionListPresenter presenter;

  @override
  handle(GetQuestionListInputData inputData) async {
    // 問題グループを取得(マスタ情報は一旦ファイルに直書きしている)
    QuestionGroup questionGroup = questionGroupListMaster.firstWhere(
      (element) => element.questionGroupCode == inputData.questionGroupCode,
    );
    // 選択中の問題グループを一時保存
    // (問題情報を取得する、という点からすると該当する問題グループを一時保存する、というのは副作用)
    // TODO: fix
    selectedQuestionGroup = questionGroup;
    // 問題リストをOutputDataへ詰め替える
    List<GetQuestionListOutputData> outputDataList = questionGroup.questionList.map((question) {
      return GetQuestionListOutputData(
        questionCode: question.questionCode,
        stationName: question.station.name,
        trainLineList: question.station.trainLineList.map((trainLine) {
          return (
            trainLineCode: trainLine.trainLine.trainLineCode,
            trainLineName: trainLine.trainLine.name,
            stationShortName: trainLine.stationShortName,
          );
        }).toList(),
      );
    }).toList();
    // Presenterへ処理を流す
    presenter.complete(outputDataList);
  }
}
