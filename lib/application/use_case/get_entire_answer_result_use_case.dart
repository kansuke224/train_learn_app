import 'package:interactive_viewer_01/application/input_boundary/i_get_entire_answer_result_use_case.dart';
import 'package:interactive_viewer_01/application/output_boundary/i_get_entire_answer_result_presenter.dart';
import 'package:interactive_viewer_01/application/output_data/get_entire_answer_result_output_data.dart';
import 'package:interactive_viewer_01/application/repository/question_group_repository.dart';
import 'package:interactive_viewer_01/application/use_case/tmp_info/selected_question_group.dart';

class GetEntireAnswerResultUseCase implements IGetEntireAnswerResultUseCase {
  GetEntireAnswerResultUseCase({
    required this.presenter,
    required this.repository,
  });

  final QuestionGroupRepository repository;
  final IGetEntireAnswerResultPresenter presenter;

  @override
  handle() {
    // 選択中のquestionGroup情報がnullの場合
    if (selectedQuestionGroup == null) {
      throw Exception("選択中のquestionGroupがnullです");
    }

    // 全体の問題数
    int answerNum = selectedQuestionGroup!.questionList.length;
    // TODO: 副作用
    // 正答数の計算
    selectedQuestionGroup = selectedQuestionGroup!.countAnswerScore();
    // ベストスコアの更新
    repository.updateBestScore(
      selectedQuestionGroup!.questionGroupCode,
      selectedQuestionGroup!.answerScore.bestScore,
    );
    int answerScore = selectedQuestionGroup!.answerScore.score;
    // 解答結果リスト
    List<({bool answerResult, String stationName, String stationShortName})> answerResultList = selectedQuestionGroup!.questionList.map(
      (question) {
        bool answerReult = question.answer.answerResult ?? false;
        String stationName = question.station.name;
        String stationShortName = question.station.trainLineList[0].stationShortName;
        return (
          answerResult: answerReult,
          stationName: stationName,
          stationShortName: stationShortName,
        );
      },
    ).toList();

    // outputDataへ詰める
    final outputData = GetEntireAnswerResultOutputData(
      answerNum: answerNum,
      answerScore: answerScore,
      answerResultList: answerResultList,
    );
    // Presenterへ処理を流す
    presenter.complete(outputData);
  }
}
