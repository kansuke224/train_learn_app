import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_changer/i_get_entire_answer_result_view_changer.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_entire_answer_result_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/entire_answer_result_provider.dart';

class GetEntireAnswerResultViewChanger implements IGetEntireAnswerResultViewChanger {
  GetEntireAnswerResultViewChanger({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  change(GetEntireAnswerResultViewModel viewModel) {
    ref.read(entireAnswerResultProvider.notifier).state = viewModel;
  }
}
