import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_changer/i_get_question_group_list_view_changer.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_group_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/question_group_list_provider.dart';

class GetQuestionGroupListViewChanger implements IGetQuestionGroupListViewChanger {
  GetQuestionGroupListViewChanger({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  change(List<GetQuestionGroupListViewModel> viewModelList) {
    // 状態の更新
    ref.read(questionGroupListProvider.notifier).state = viewModelList;
  }
}
