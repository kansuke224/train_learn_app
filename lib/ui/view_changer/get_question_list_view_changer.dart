import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_changer/i_get_question_list_view_changer.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/question_list_provider.dart';

class GetQuestionListViewChanger implements IGetQuestionListViewChanger {
  GetQuestionListViewChanger({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  change(List<GetQuestionListViewModel> viewModelList) {
    // 状態の更新
    ref.read(questionListProvider.notifier).state = viewModelList;
  }
}
