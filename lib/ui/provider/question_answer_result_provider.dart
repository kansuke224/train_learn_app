import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/enum/answer_result.dart';

final questionAnswerResultProvider = StateProvider.autoDispose.family<AnswerResult, String>(
  (ref, questionCode) {
    return AnswerResult.unAnswerd;
  },
);
