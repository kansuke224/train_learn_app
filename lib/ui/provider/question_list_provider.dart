import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';

final questionListProvider = StateProvider.autoDispose<List<GetQuestionListViewModel>?>(
  (ref) => null,
);
