import 'package:interactive_viewer_01/application/input_boundary/i_get_question_group_list_use_case.dart';
import 'package:interactive_viewer_01/application/output_boundary/i_get_question_group_list_presenter.dart';
import 'package:interactive_viewer_01/application/output_data/get_question_group_list_output_data.dart';
import 'package:interactive_viewer_01/application/repository/question_group_repository.dart';
import 'package:interactive_viewer_01/application/use_case/master_info/master_info.dart';
import 'package:interactive_viewer_01/domain/model/question_group.dart';

class GetQuestionGroupListUseCase implements IGetQuestionGroupListUseCase {
  GetQuestionGroupListUseCase({
    required this.repository,
    required this.presenter,
  });

  final QuestionGroupRepository repository;
  final IGetQuestionGroupListPresenter presenter;

  @override
  handle() async {
    // 路線図の問題リストを取得(マスタ情報は一旦ファイルに直書きしている)
    List<QuestionGroup> questionGroupList = questionGroupListMaster;
    // 各問題についてベスト正答数を取得する
    questionGroupList = await Future.wait(
      questionGroupList.map((questionGroup) async {
        final int bestScore = await repository.getBestScore(
          questionGroup.questionGroupCode,
        );
        return questionGroup.setBestScore(bestScore);
      }),
    );
    // OutputDataへ詰め替える
    final List<GetQuestionGroupListOutputData> outputDataList = questionGroupList.map((e) {
      return GetQuestionGroupListOutputData(
        questionGroupCode: e.questionGroupCode,
        questionName: e.questionGroupName,
        questionNum: e.questionList.length,
        bestScore: e.answerScore.bestScore,
      );
    }).toList();
    // Presenterへ処理を流す
    presenter.complete(outputDataList);
  }
}
