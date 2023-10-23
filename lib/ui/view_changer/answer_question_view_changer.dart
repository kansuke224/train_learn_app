import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_changer/i_answer_question_view_changer.dart';
import 'package:interactive_viewer_01/presentation/view_model/answer_question_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/is_all_answer_finished_provider.dart';
import 'package:interactive_viewer_01/ui/provider/question_answer_result_provider.dart';

class AnswerQuestionViewChanger implements IAnswerQuestionViewChanger {
  AnswerQuestionViewChanger({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  change(AnswerQuestionViewModel viewModel) {
    // questionCodeから、該当駅の解答結果を保持するproviderを取得
    final provider = questionAnswerResultProvider(viewModel.questionCode);
    // 解答結果の状態の更新
    ref.read(provider.notifier).state = viewModel.answerResult;

    // 全ての解答が終了しているかどうかの状態の更新
    ref.read(isAllAnswerFinishedProvider.notifier).state = viewModel.isAllAnswerFinished;
  }
}
