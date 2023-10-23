import 'package:interactive_viewer_01/application/input_boundary/i_answer_question_use_case.dart';
import 'package:interactive_viewer_01/application/input_data/answer_question_input_data.dart';
import 'package:interactive_viewer_01/application/output_boundary/i_answer_question_presenter.dart';
import 'package:interactive_viewer_01/application/output_data/answer_question_output_data.dart';
import 'package:interactive_viewer_01/application/use_case/tmp_info/selected_question_group.dart';

class AnswerQuestionUseCase implements IAnswerQuestionUseCase {
  AnswerQuestionUseCase({
    required this.presenter,
  });
  final IAnswerQuestionPresenter presenter;

  @override
  handle(AnswerQuestionInputData inputData) {
    // 選択中のquestionGroup情報がnullの場合
    if (selectedQuestionGroup == null) {
      throw Exception("選択中のquestionGroupがnullです");
    }
    // 解答結果をセットする
    selectedQuestionGroup = selectedQuestionGroup!.setAnswerToQuestion(
      inputData.questionCode,
      inputData.answer,
    );
    // 解答結果を取得
    // (上の処理で解答結果をセットしているので、getAnswerResultFromQuestionの返り値がnullなことはあり得ない)
    bool answerResult = selectedQuestionGroup!.getAnswerResultFromQuestion(
      inputData.questionCode,
    )!;
    // 全体で解答が終了しているかどうかを取得
    bool isAllAnswerFinished = selectedQuestionGroup!.getIsAnswerFinished();
    // OutputDataへ詰め替える
    final outputData = AnswerQuestionOutputData(
      questionCode: inputData.questionCode,
      answerResult: answerResult,
      isAllAnswerFinished: isAllAnswerFinished,
    );
    // Presenterへ処理を流す
    presenter.complete(outputData);
  }
}
