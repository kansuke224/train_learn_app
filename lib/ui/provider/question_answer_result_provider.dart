import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AnswerResult {
  unAnswerd,
  correct,
  unCorrect,
}

final questionAnswerResultProvider = StateProvider.family<AnswerResult, String>(
  (ref, questionCode) {
    return AnswerResult.unAnswerd;
  },
);
